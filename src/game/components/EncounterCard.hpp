#ifndef JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_CARD_
#define JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_CARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

        class EncounterCard :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::EncounterCard )
			
        private:
            enum class CardType {
                ENCOUNTER_BEGIN,
                ENCOUNTER_SUCCEEDED,
                ENCOUNTER_FAILED
            };
                
		public:
			explicit EncounterCard( crimild::scripting::ScriptEvaluator & );
			virtual ~EncounterCard( void );
            
            virtual void start( void ) override;
                
        private:
            void prepareForEncounter( void );
            
        private:
            CardType _cardType;
            crimild::Text *_title = nullptr;
            crimild::Text *_description = nullptr;
            crimild::Text *_action = nullptr;
		};

	}

}

#endif


				
