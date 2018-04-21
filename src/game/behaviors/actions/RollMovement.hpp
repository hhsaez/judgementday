#ifndef JUDGEMENT_DAY_BEHAVIORS_ACTIONS_ROLL_MOVEMENT_
#define JUDGEMENT_DAY_BEHAVIORS_ACTIONS_ROLL_MOVEMENT_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace behaviors {

		namespace actions {

            class RollMovement : public crimild::behaviors::Behavior {
				CRIMILD_IMPLEMENT_RTTI( judgementday::behaviors::actions::RollMovement )

			public:
				explicit RollMovement( crimild::scripting::ScriptEvaluator & );
				virtual ~RollMovement( void );

				virtual void init( crimild::behaviors::BehaviorContext *context ) override;
				
				virtual crimild::behaviors::Behavior::State step( crimild::behaviors::BehaviorContext *context ) override;
			};

		}

	}

}

#endif

