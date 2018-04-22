#include "Player.hpp"
#include "Board.hpp"
#include "Navigation.hpp"
#include "Actor.hpp"
#include "common/Action.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::navigation;
using namespace crimild::scripting;

Player::Player( ScriptEvaluator & )
{
    
}

Player::~Player( void )
{

}

void Player::start( void )
{
    registerMessageHandler< messaging::SpawnPlayer >( [ this ]( messaging::SpawnPlayer const &m ) {
        _board = m.board->getComponent< Board >();
        _navigation = m.board->getComponent< Navigation >();
        
        _currentWaypoint = _navigation->getStartWaypoint();
        
        const auto startPos = _currentWaypoint->getWorld().getTranslate();
        getNode()->local().setTranslate( startPos );
        
        getNode()->getComponent< NavigationController >()->teleport( startPos );
    });

	registerMessageHandler< messaging::BeginPlayerTurn >( [ this ]( messaging::BeginPlayerTurn const & ) {
		onTurnBegan();
	});
    
    registerMessageHandler< messaging::PlayerSelectedAction >( [ this ]( messaging::PlayerSelectedAction const &m ) {
        onActionSelected( m.action );
    });
}

void Player::onTurnBegan( void )
{
    broadcastMessage( messaging::BeginPlayerUnkeep {} );
    
    auto actor = getComponent< Actor >();
    
    while ( actor->drawCard( 5 ) ) {
        broadcastMessage( messaging::PlayerDrawCard {} );
    }

	broadcastMessage( messaging::EndPlayerUnkeep {} );
    broadcastMessage( messaging::BeginPlayerMainPhase {} );
}

void Player::onActionSelected( Action *action )
{
    auto actor = getComponent< Actor >();
    if ( actor->getAP() < action->getCost() ) {
        crimild::Log::debug( CRIMILD_CURRENT_CLASS_NAME, "Not enough AP" );
        return;
    }
    
    actor->setAP( actor->getAP() - action->getCost() );
    
    if ( action->getDamage() > 0 ) {
        crimild::Log::debug( CRIMILD_CURRENT_CLASS_NAME, "Player does damage: ", action->getDamage() );
        broadcastMessage( messaging::PlayerDidAttack { action->getDamage() } );
    }
    
    if ( action->getHP() > 0 ) {
        actor->setHP( Numerici::min( actor->getMaxHP(), actor->getHP() + action->getHP() ) );
    }
    
    actor->discard( action );
    
    broadcastMessage( messaging::PlayerExecutedAction {} );
    broadcastMessage( messaging::EndPlayerMainPhase {} );
    broadcastMessage( messaging::EndPlayerTurn {} );
}

