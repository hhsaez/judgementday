#include "Board.hpp"
#include "Navigation.hpp"
#include "UIEventButton.hpp"
#include "Player.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

Board::Board( ScriptEvaluator & )
{

}

Board::~Board( void )
{

}

void Board::start( void )
{
    registerMessageHandler< messaging::UIEvent >( [ this ]( messaging::UIEvent const &m ) {
        auto eventName = m.eventName;
        
		broadcastMessage( crimild::messaging::BehaviorEvent { eventName } );

        if ( eventName == "quit" ) {
            Simulation::getInstance()->stop();
        }
		else if ( eventName == "combatWillStart" ) {
            broadcastMessage( messaging::CombatBegan {} );
			broadcastMessage( messaging::BeginPlayerTurn {} );
		}
    });
    
    registerMessageHandler< messaging::EndPlayerTurn >( [ this ]( messaging::EndPlayerTurn const & ) {
        //broadcastMessage( crimild::messaging::BehaviorEvent { "combatDidEnd" } );
        broadcastMessage( messaging::BeginPlayerTurn {} );
    });
    
    getComponent< Navigation >()->configure();

    broadcastMessage( messaging::BoardReady { getNode() } );
    broadcastMessage( messaging::SpawnPlayer { getNode() } );
}

