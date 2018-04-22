#include "ActionCard.hpp"
#include "Board.hpp"
#include "common/Action.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

ActionCard::ActionCard( ScriptEvaluator & )
{

}

ActionCard::~ActionCard( void )
{

}

void ActionCard::start( void )
{
    auto root = getNode< Group >();
    
    _title = root->getNode< Text >( "title" );
    _description = root->getNode< Text >( "description" );
    _cost = root->getNode< Text >( "cost" );
    
    getNode()->attachComponent< UIResponder >( []( Node *node ) {
        auto card = node->getComponent< ActionCard >();
        auto action = card->getAction();
        
        card->broadcastMessage( messaging::PlayerSelectedAction { action } );
        
        return true;
    })->setEnabled( false );
    
    registerMessageHandler< messaging::BeginPlayerMainPhase >( [ this ]( messaging::BeginPlayerMainPhase const & ) {
        if ( auto responder = getComponent< UIResponder >() ) {
            responder->setEnabled( false );
        }
    });

    registerMessageHandler< messaging::BeginPlayerMainPhase >( [ this ]( messaging::BeginPlayerMainPhase const & ) {
        if ( auto responder = getComponent< UIResponder >() ) {
            responder->setEnabled( true );
        }
    });
}

void ActionCard::setAction( SharedPointer< Action > const &action )
{
    _action = action;
    
    std::stringstream ss;

    _title->setText( _action->getName() );
    _description->setText( _action->getDescription() );
    
    ss << "Cost: " << _action->getCost() << "AP";
    _cost->setText( ss.str() );
}

