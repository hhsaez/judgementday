#include "MonsterCard.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

MonsterCard::MonsterCard( ScriptEvaluator & )
{

}

MonsterCard::~MonsterCard( void )
{

}

void MonsterCard::start( void )
{
	/*
	auto scene = getNode()->getRootNode();
	scene->perform( Apply( [ this ]( Node *node ) {
		if ( node->getComponent< Player >() != nullptr ) {
			_player = node;
		}
	});
	*/

	auto root = getNode< Group >();
	_hp = root->getNode< Text >( "hp" );
}

void MonsterCard::update( const Clock & )
{
	std::stringstream ss;
	ss << "4/7";
	_hp->setText( ss.str() );
}

