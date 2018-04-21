#ifndef JUDGEMENT_DAY_COMPONENTS_PLAYER_
#define JUDGEMENT_DAY_COMPONENTS_PLAYER_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class Player :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Player )
			
		public:
			explicit Player( crimild::scripting::ScriptEvaluator & );
			virtual ~Player( void );
                
            virtual void start( void ) override;
		};

	}

}

#endif


				
