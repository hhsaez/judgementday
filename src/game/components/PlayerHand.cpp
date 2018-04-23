#include "PlayerHand.hpp"
#include "Player.hpp"
#include "Actor.hpp"
#include "ActionCard.hpp"
#include "Board.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

PlayerHand::PlayerHand( ScriptEvaluator & )
{

}

PlayerHand::~PlayerHand( void )
{

}

void PlayerHand::start( void )
{
	auto scene = getNode()->getRootParent();
	scene->perform( Apply( [ this ]( Node *node ) {
		if ( node->getComponent< Player >() != nullptr ) {
			_player = node;
		}
	}));

	registerMessageHandler< messaging::BeginPlayerTurn >( [ this ]( messaging::BeginPlayerTurn const & ) {
		refreshCards();
	});

	registerMessageHandler< messaging::PlayerDrawCard >( [ this ]( messaging::PlayerDrawCard const & ) {
		refreshCards();
	});
    
    registerMessageHandler< messaging::PlayerExecutedAction >( [ this ]( messaging::PlayerExecutedAction const & ) {
        refreshCards();
    });
}

void PlayerHand::refreshCards( void )
{
	auto root = getNode< Group >();
	
	auto playerActor = _player->getComponent< Actor >();

	const auto cardsInHand = playerActor->getHand().size();

    crimild::Size i = 0;
    for ( ; i < cardsInHand; i++ ) {
        auto cardNode = root->getNodeAt( i );
        auto card = cardNode->getComponent< ActionCard >();
        
        if ( auto action = playerActor->getHand()[ i ] ) {
            cardNode->setEnabled( true );
            card->setAction( action );
        }
    }
    
    for ( ; i < root->getNodeCount(); i++ ) {
        root->getNodeAt( i )->setEnabled( false );
    }

}

