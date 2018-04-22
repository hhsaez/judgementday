#include "Action.hpp"

using namespace judgementday;

using namespace crimild;
using namespace crimild::scripting;

Action::Action( ScriptEvaluator &eval )
{
	eval.getPropValue( "name", _name );
	eval.getPropValue( "description", _description );
	eval.getPropValue( "cost", _cost );
	eval.getPropValue( "damage", _damage );
	eval.getPropValue( "hp", _hp );
}

Action::~Action( void )
{

}

