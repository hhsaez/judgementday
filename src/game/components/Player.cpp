#include "Player.hpp"
#include "Board.hpp"
#include "Navigation.hpp"

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
}

