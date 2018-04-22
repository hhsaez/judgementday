#ifndef JUDGEMENT_DAY_COMPONENTS_PLAYER_HAND_
#define JUDGEMENT_DAY_COMPONENTS_PLAYER_HAND_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class PlayerHand :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::PlayerHand )
			
		public:
			explicit PlayerHand( crimild::scripting::ScriptEvaluator & );
			virtual ~PlayerHand( void );

			virtual void start( void ) override;

		private:
			void refreshCards( void );

		private:
			crimild::Node *_player = nullptr;
		};

	}

}

#endif


				
