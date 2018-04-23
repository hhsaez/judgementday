#include "MonsterCard.hpp"
#include "Monster.hpp"
#include "Board.hpp"
#include "Actor.hpp"

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
	auto root = getNode< Group >();
	_name = root->getNode< Text >( "name" );
    _description = root->getNode< Text >( "description" );
    _hp = root->getNode< Text >( "hp" );
    _ap = root->getNode< Text >( "ap" );
    
    registerMessageHandler< messaging::CombatBegan >( [ this ]( messaging::CombatBegan ) {
		_monster = nullptr;
		auto scene = getNode()->getRootParent();
		scene->perform( Apply( [ this ]( Node *node ) {
			if ( node->getComponent< Monster >() != nullptr ) {
				_monster = node;
			}
		}));
	});

	registerMessageHandler< messaging::CombatEnded >( [ this ]( messaging::CombatEnded ) {
		_monster = nullptr;
	});
}

void MonsterCard::update( const Clock & )
{
	if ( _monster == nullptr ) {
		return;
	}

    auto actor = _monster->getComponent< Actor >();
	std::stringstream ss;

	_name->setText( actor->getName() );
	_description->setText( actor->getDescription() );
	
    ss << "HP: " << actor->getHP() << "/" << actor->getMaxHP();
	_hp->setText( ss.str() );

    ss.str( "" );
    ss << "AP: " << actor->getAP() << "/" << actor->getMaxAP();
    _ap->setText( ss.str() );	
}

