#include "Board.hpp"
#include "Navigation.hpp"
#include "UIEventButton.hpp"
#include "Player.hpp"
#include "Monster.hpp"

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
        else if ( eventName == "restartGame" ) {
            Simulation::getInstance()->broadcastMessage( crimild::messaging::ReloadScene { } );
        }
		else if ( eventName == "combatWillStart" ) {
            startCombat();
		}
    });
    
    registerMessageHandler< messaging::EndPlayerTurn >( [ this ]( messaging::EndPlayerTurn const & ) {
        broadcastMessage( messaging::BeginPlayerTurn {} );
    });
    
    registerMessageHandler< messaging::MonsterKilled >( [ this ]( messaging::MonsterKilled const & ) {
        broadcastMessage( messaging::CombatEnded {} );
        broadcastMessage( crimild::messaging::BehaviorEvent { "combatDidEnd" } );
    });
    
    registerMessageHandler< messaging::PlayerKilled >( [ this ]( messaging::PlayerKilled const & ) {
        broadcastMessage( messaging::CombatEnded {} );
        broadcastMessage( crimild::messaging::BehaviorEvent { "encounterDidFail" } );
    });
    
    getComponent< Navigation >()->configure();

    broadcastMessage( messaging::BoardReady { getNode() } );
    broadcastMessage( messaging::SpawnPlayer { getNode() } );
}

void Board::startCombat( void )
{
    LuaSceneBuilder builder( "defaultMonster" );
    auto monster = builder.fromFile( FileSystem::getInstance().pathForResource( "assets/scripts/prefabs/monster.lua" ) );
    getNode()->getRootParent< Group >()->attachNode( monster );
    monster->startComponents();
    
    broadcastMessage( messaging::CombatBegan {} );
    broadcastMessage( messaging::BeginPlayerTurn {} );

}
