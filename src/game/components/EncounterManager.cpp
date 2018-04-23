#include "EncounterManager.hpp"
#include "common/Action.hpp"

using namespace judgementday;
using namespace judgementday::components;

using namespace crimild;
using namespace crimild::scripting;

EncounterManager::EncounterManager( ScriptEvaluator &eval )
{
    eval.foreach( "encounters", [ this ]( ScriptEvaluator &encounterEval, int ) {
        std::string id;
        encounterEval.getPropValue( "id", id );
        
        EncounterInfo info;
        
        std::string encounterType;
        encounterEval.getPropValue( "encounterType", encounterType );
        if ( encounterType == "exploration" ) info.type = EncounterInfo::Type::EXPLORATION;
        else if ( encounterType == "combat" ) info.type = EncounterInfo::Type::COMBAT;
        else if ( encounterType == "endGame" ) info.type = EncounterInfo::Type::END_GAME;
        
        encounterEval.getPropValue( "title", info.title );
        encounterEval.getPropValue( "description", info.description );
        encounterEval.getPropValue( "action", info.action );

        encounterEval.getPropValue( "successDescription", info.successDescription );
        encounterEval.getPropValue( "successAction", info.successAction );
        
        encounterEval.foreach( "loot", [ &info ]( ScriptEvaluator &actionEval, int ) {
            auto action = crimild::alloc< Action >( actionEval );
            info.loot.add( action );
        });

        encounterEval.getPropValue( "failureDescription", info.failureDescription );
        encounterEval.getPropValue( "failureAction", info.failureAction );

        _encounters[ id ] = info;
    });
}

EncounterManager::~EncounterManager( void )
{

}

