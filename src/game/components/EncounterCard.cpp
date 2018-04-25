#include "EncounterCard.hpp"
#include "EncounterManager.hpp"
#include "Player.hpp"
#include "Actor.hpp"
#include "UIEventButton.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

EncounterCard::EncounterCard( ScriptEvaluator &eval )
{
    std::string cardType;
    eval.getPropValue( "cardType", cardType );
    if ( cardType == "encounter_begin" ) _cardType = CardType::ENCOUNTER_BEGIN;
    else if ( cardType == "encounter_succeeded" ) _cardType = CardType::ENCOUNTER_SUCCEEDED;
    else if ( cardType == "encounter_failed" ) _cardType = CardType::ENCOUNTER_FAILED;
}

EncounterCard::~EncounterCard( void )
{

}

void EncounterCard::start( void )
{
    auto root = getNode< Group >();
    _title = root->getNode< Text >( "title" );
    _description = root->getNode< Text >( "description" );
    _action = root->getNode< Text >( "action" );
    
    registerMessageHandler< crimild::messaging::BehaviorEvent >( [ this ]( crimild::messaging::BehaviorEvent const &m ) {
        if ( m.name == "encounterWillStart" && _cardType == CardType::ENCOUNTER_BEGIN ) {
			crimild::concurrency::sync_frame( [ this ]() {
				prepareForEncounter();
			});
        }
        else if ( m.name == "encounterDidSucceed" && _cardType == CardType::ENCOUNTER_SUCCEEDED ) {
			crimild::concurrency::sync_frame( [ this ]() {
				prepareForEncounter();
			});
        }
        else if ( m.name == "encounterDidFail" && _cardType == CardType::ENCOUNTER_FAILED ) {
			crimild::concurrency::sync_frame( [ this ]() {
				prepareForEncounter();
			});
        }
    });
}

void EncounterCard::prepareForEncounter( void )
{
    auto player = Player::getInstance();
    auto wp = player->getCurrentWaypoint();
    auto id = wp->getName();
    
    auto encounter = EncounterManager::getInstance()->getEncounter( id );
    
    _title->setText( encounter.title );

	auto lineSize = 30;
    
    switch ( _cardType ) {
        case CardType::ENCOUNTER_BEGIN: {
            _description->setText( StringUtils::splitLines( encounter.description, lineSize ) );
            _action->setText( encounter.action );
            switch ( encounter.type ) {
                case EncounterInfo::Type::END_GAME:
                case EncounterInfo::Type::EXPLORATION:
                    _action->attachComponent< UIEventButton >( "encounterDidSucceed" );
                    break;

                case EncounterInfo::Type::COMBAT:
                default:
                    _action->attachComponent< UIEventButton >( "combatWillStart" );
                    break;
            }
            break;
        }
            
        case CardType::ENCOUNTER_SUCCEEDED: {
            _description->setText( StringUtils::splitLines( encounter.successDescription, lineSize ) );
            _action->setText( encounter.successAction );
            switch ( encounter.type ) {
                case EncounterInfo::Type::END_GAME:
                    _action->attachComponent< UIEventButton >( "restartGame" );
                    break;
                    
                default:
                    _action->attachComponent< UIEventButton >( "encounterDidEnd" );
                    break;
            }
            player->loot( encounter.loot );
            break;
        }
            
        case CardType::ENCOUNTER_FAILED: {
            _description->setText( StringUtils::splitLines( encounter.failureDescription, lineSize ) );
            _action->setText( encounter.failureAction );
            _action->attachComponent< UIEventButton >( "restartGame" );
            break;
        }
    }
}

