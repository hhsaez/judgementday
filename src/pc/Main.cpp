#include <Crimild.hpp>
#include <Crimild_Scripting.hpp>
#include <Crimild_OpenGL.hpp>

#ifdef CRIMILD_PLATFORM_DESKTOP
#include <Crimild_GLFW.hpp>
#endif

using namespace crimild;
using namespace crimild::messaging;
using namespace crimild::behaviors;
using namespace crimild::scripting;

int main( int argc, char **argv )
{
    auto settings = crimild::alloc< LuaSettings >( argc, argv );
    settings->set( "video.width", 1024 );
    settings->set( "video.height", 768 );
    settings->set( "video.fullscreen", false );
    settings->parseCommandLine( argc, argv );

    auto sim = crimild::alloc< GLSimulation >( "Judgement Day: The Board Game", settings );
    
    return sim->run();
};

