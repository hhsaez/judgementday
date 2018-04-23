#include "Actor.hpp"
#include "Board.hpp"
#include "common/Action.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

Actor::Actor( ScriptEvaluator &eval )
{
    eval.getPropValue( "name", _name );
    eval.getPropValue( "description", _description );
	eval.getPropValue( "hp", _hp );
	eval.getPropValue( "maxHP", _maxHP );
	eval.getPropValue( "ap", _ap );
	eval.getPropValue( "maxAP", _maxAP );

	eval.foreach( "deck", [ this ]( ScriptEvaluator &actionEval, int ) {
		auto action = crimild::alloc< Action >( actionEval );
		_deck.add( action );
		_hand.add( action );
	});
}

Actor::~Actor( void )
{

}

void Actor::start( void )
{
    registerMessageHandler< messaging::CombatBegan >( [ this ]( messaging::CombatBegan const & ) {
        onCombatBegan();
    });
}

void Actor::update( const Clock &c )
{
    _timer += c.getDeltaTime();
    if ( _timer >= 1.0 ) {
        setAP( Numerici::min( getMaxAP(), getAP() + 1 ) );
        _timer = 0.0f;
    }
}

void Actor::addActionsToDeck( ActionArray &actions )
{
    actions.each( [ this ]( SharedPointer< Action > &action, crimild::Size ) {
        _deck.add( action );
    });
}

bool Actor::drawCard( crimild::Int16 maxHandSize )
{
    if ( getHand().size() == maxHandSize ) {
        return false;
    }
    
    if ( getStack().empty() ) {
        return false;
    }
    
    auto action = getStack().pop();
    getHand().add( action );
    return true;
}

void Actor::discard( Action *action )
{
    auto elem = crimild::retain( action );
    getDiscarded().add( elem );
    getHand().remove( elem );
}

void Actor::onCombatBegan( void )
{
    _ap = 0;
    
    getDiscarded().clear();
    getHand().clear();
    
    std::vector< SharedPointer< Action >> actions;
    getDeck().each( [ &actions ]( SharedPointer< Action > &action, crimild::Size ) {
        actions.push_back( action );
    });
    std::random_shuffle( std::begin( actions ), std::end( actions ) );
    
    getStack().clear();
    for ( auto a : actions ) {
        getStack().push( a );
    }
}

