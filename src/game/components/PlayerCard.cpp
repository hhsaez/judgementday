#include "PlayerCard.hpp"
#include "Player.hpp"
#include "Actor.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

PlayerCard::PlayerCard( ScriptEvaluator & )
{

}

PlayerCard::~PlayerCard( void )
{

}

void PlayerCard::start( void )
{
    auto scene = getNode()->getRootParent();
	scene->perform( Apply( [ this ]( Node *node ) {
		if ( node->getComponent< Player >() != nullptr ) {
			_player = node;
		}
	}));

    auto root = getNode< Group >();
	_hp = root->getNode< Text >( "hp" );
    _ap = root->getNode< Text >( "ap" );
}

void PlayerCard::update( const Clock & )
{
    auto actor = _player->getComponent< Actor >();
	std::stringstream ss;
	
    ss << "HP: " << actor->getHP() << "/" << actor->getMaxHP();
	_hp->setText( ss.str() );

    ss.str( "" );
    ss << "AP: " << actor->getAP() << "/" << actor->getMaxAP();
    _ap->setText( ss.str() );
}

