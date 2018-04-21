#include "Player.hpp"
#include "Navigation.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

Player::Player( ScriptEvaluator & )
{

}

Player::~Player( void )
{

}

void Player::start( void )
{
    registerMessageHandler< messaging::BoardReady >( [ this ]( messaging::BoardReady const &m ) {
        getNode()->local().setTranslate( m.start->getWorld().getTranslate() );
    });
    
}

