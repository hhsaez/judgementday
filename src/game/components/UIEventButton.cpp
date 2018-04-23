#include "UIEventButton.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

UIEventButton::UIEventButton( std::string eventName )
    : _eventName( eventName )
{
    
}

UIEventButton::UIEventButton( ScriptEvaluator &eval )
{
	eval.getPropValue( "eventName", _eventName );
}

UIEventButton::~UIEventButton( void )
{

}

void UIEventButton::onAttach( void )
{
	getNode()->attachComponent< UIResponder >( [ this ]( Node * ) {
		broadcastMessage( messaging::UIEvent { _eventName } );
		return true;
	});
}

