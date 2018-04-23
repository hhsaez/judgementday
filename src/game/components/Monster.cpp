#include "Monster.hpp"
#include "Board.hpp"
#include "Actor.hpp"
#include "common/Action.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

Monster::Monster( void )
{
    
}

Monster::Monster( ScriptEvaluator & )
{
    
}

Monster::~Monster( void )
{

}

void Monster::start( void )
{
    registerMessageHandler< messaging::PlayerDidAttack >( [ this ]( messaging::PlayerDidAttack const &m ) {
        onHit( m.damage );
    });
    
    registerMessageHandler< messaging::CombatEnded >( [ this ]( messaging::CombatEnded const &m ) {
        crimild::concurrency::sync_frame( [ this ] {
            getNode()->detachFromParent();
        });
    });
    
    auto actor = getComponent< Actor >();
    actor->drawCard( 1 );
}

void Monster::update( const crimild::Clock & )
{
    auto actor = getComponent< Actor >();
    auto action = actor->getHand()[ 0 ];
    if ( actor->getAP() >= action->getCost() ) {
        actor->setAP( actor->getAP() - action->getCost() );
        
        if ( action->getDamage() > 0 ) {
            broadcastMessage( messaging::MonsterDidAttack { action->getDamage() } );
        }
    }
}

void Monster::onHit( crimild::Int16 damage )
{
    auto actor = getComponent< Actor >();
    actor->setHP( actor->getHP() - damage );
    if ( actor->getHP() <= 0 ) {
        broadcastMessage( messaging::MonsterKilled {} );
    }
}


