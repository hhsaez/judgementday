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
        
        if ( eventName == "quit" ) {
            Simulation::getInstance()->stop();
        }
        else {
            broadcastMessage( crimild::messaging::BehaviorEvent { eventName } );
        }
    });

    getComponent< Navigation >()->configure();

    broadcastMessage( messaging::BoardReady { getNode() } );
    broadcastMessage( messaging::SpawnPlayer { getNode() } );
}

