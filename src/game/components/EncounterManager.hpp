#ifndef JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_MANAGER_
#define JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_MANAGER_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    class Action;

    struct EncounterInfo {
        enum class Type {
            COMBAT,
            EXPLORATION,
            END_GAME,
        };
        
        Type type;
        std::string title;
        std::string description;
        std::string action;
        std::string monsterId;
        std::string successDescription;
        std::string successAction;
        crimild::containers::Array< crimild::SharedPointer< Action >> loot;
        std::string failureDescription;
        std::string failureAction;
    };
    
	namespace components {

        class EncounterManager :
            public crimild::NodeComponent,
            public crimild::Messenger,
			public crimild::DynamicSingleton< EncounterManager > {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::EncounterManager )

		public:
			explicit EncounterManager( crimild::scripting::ScriptEvaluator & );
			virtual ~EncounterManager( void );

			const EncounterInfo &getEncounter( std::string id ) { return _encounters[ id ]; }
            
        private:
            crimild::containers::Map< std::string, EncounterInfo > _encounters;
		};

	}

}

#endif


				
