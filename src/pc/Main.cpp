#include "JudgementDayCommon.hpp"

#include "components/ActionCard.hpp"
#include "components/Actor.hpp"
#include "components/Board.hpp"
#include "components/EncounterCard.hpp"
#include "components/Monster.hpp"
#include "components/MonsterCard.hpp"
#include "components/Navigation.hpp"
#include "components/Player.hpp"
#include "components/PlayerCard.hpp"
#include "components/PlayerHand.hpp"
#include "components/UIEventButton.hpp"
#include "components/Waypoint.hpp"

#include "behaviors/actions/RollMovement.hpp"

using namespace crimild;
using namespace crimild::messaging;
using namespace crimild::behaviors;
using namespace crimild::scripting;

void init_all( void )
{
    crimild::init();
    crimild::scripting::init();
    
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::ActionCard )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Actor )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Board )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::EncounterCard )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Monster )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::MonsterCard )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Navigation )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Player )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::PlayerCard )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::PlayerHand )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::UIEventButton )
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::components::Waypoint )
    
    CRIMILD_SCRIPTING_REGISTER_BUILDER( judgementday::behaviors::actions::RollMovement )
}

int main( int argc, char **argv )
{
    init_all();
    
    auto settings = crimild::alloc< LuaSettings >( argc, argv );
    settings->set( "video.width", 1024 );
    settings->set( "video.height", 768 );
    settings->set( "video.fullscreen", false );
    settings->parseCommandLine( argc, argv );

    auto sim = crimild::alloc< GLSimulation >( "Judgement Day: The Board Game", settings );
    
    AssetManager::getInstance()->loadFont( AssetManager::FONT_SYSTEM, "assets/fonts/Courier New.txt" );
    Profiler::getInstance()->setOutputHandler( crimild::alloc< ProfilerScreenOutputHandler >() );
    
    auto scene = settings->get< std::string >( "scene", "assets/scripts/scenes/game.lua" );
    Simulation::getInstance()->loadScene( scene, crimild::alloc< crimild::scripting::LuaSceneBuilder >() );
    
    sim->registerMessageHandler< crimild::messaging::KeyReleased >( [settings]( crimild::messaging::KeyReleased const &msg ) {
        switch ( msg.key ) {
            case 'R':
                Simulation::getInstance()->broadcastMessage( crimild::messaging::ReloadScene { } );
                break;
                
            case 'K':
                Simulation::getInstance()->broadcastMessage( crimild::messaging::ToggleDebugInfo { } );
                break;
                
            case 'L':
                Simulation::getInstance()->broadcastMessage( crimild::messaging::ToggleProfilerInfo { } );
                break;
        }
    });
    
    return sim->run();
};

