#ifndef JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_CARD_
#define JUDGEMENT_DAY_COMPONENTS_ENCOUNTER_CARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class EncounterCard : public crimild::NodeComponent {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::EncounterCard )
			
		public:
			explicit EncounterCard( crimild::scripting::ScriptEvaluator & );
			virtual ~EncounterCard( void );
		};

	}

}

#endif


				
