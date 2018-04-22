#include "RollMovement.hpp"

#include "components/Player.hpp"
#include "components/Waypoint.hpp"

using namespace judgementday;
using namespace judgementday::components;
using namespace judgementday::behaviors::actions;

using namespace crimild;

RollMovement::RollMovement( crimild::scripting::ScriptEvaluator & )
{

}

RollMovement::~RollMovement( void )
{
	
}

void RollMovement::init( crimild::behaviors::BehaviorContext *context )
{
	Behavior::init( context );

	
}

crimild::behaviors::Behavior::State RollMovement::step( crimild::behaviors::BehaviorContext *context )
{
	auto player = context->getAgent()->getComponent< Player >();
	if ( player == nullptr ) {
        crimild::Log::error( CRIMILD_CURRENT_CLASS_NAME, "Behavior must be attach to a player" );
		return crimild::behaviors::Behavior::State::FAILURE;
	}

	auto wp = player->getCurrentWaypoint();
	if ( wp == nullptr ) {
        crimild::Log::error( CRIMILD_CURRENT_CLASS_NAME, "No current waypoint" );
		return crimild::behaviors::Behavior::State::FAILURE;
	}

//    auto roll = Random::generate< crimild::Int8 >( 1, 7 );
    auto roll = 1;
    
    auto current = wp->getComponent< Waypoint >();
    while ( roll > 0 && current->getNext() != nullptr ) {
        current = current->getNext()->getComponent< Waypoint >();
        --roll;
    }
    
    auto next = current->getNode();

	player->setCurrentWaypoint( next );
	
	context->addTarget( next );
	
	return crimild::behaviors::Behavior::State::SUCCESS;
}

