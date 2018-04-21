#include "Navigation.hpp"
#include "Waypoint.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

Navigation::Navigation( ScriptEvaluator & )
{

}

Navigation::~Navigation( void )
{

}

void Navigation::configure( void )
{
    auto root = getNode< Group >();
    const auto N = root->getNodeCount();
    
    for ( crimild::Size i = 0; i < N - 1; i++ ) {
        auto currentWP = root->getNodeAt( i )->getComponent< Waypoint >();
        auto nextWP = root->getNodeAt( i + 1 )->getComponent< Waypoint >();
        if ( currentWP != nullptr && nextWP != nullptr ) {
            currentWP->setNext( nextWP->getNode() );
        }
    }
}

Node *Navigation::getStartWaypoint( void )
{
    return getNode< Group >()->getNodeAt( 0 );
}

void Navigation::renderDebugInfo( Renderer *renderer, Camera *camera)
{
    auto root = getNode< Group >();
    
    containers::Array< Vector3f > links;
    
    root->forEachNode( [ renderer, camera, &links ]( Node *n ) {
        auto pos = n->getWorld().getTranslate();
        DebugRenderHelper::renderSphere( renderer, camera, pos, 0.5f, RGBAColorf( 0.0, 1.0f, 0.0, 0.5f ) );
        
        if ( auto wp = n->getComponent< Waypoint >() ) {
            if ( auto next = wp->getNext() ) {
                links.add( pos );
                links.add( next->getWorld().getTranslate() );
            }
        }
    });
    
    DebugRenderHelper::renderLines( renderer, camera, &links[ 0 ], links.size(), RGBAColorf( 0.0, 0.25f, 0.0f, 0.5f ) );
    
}

