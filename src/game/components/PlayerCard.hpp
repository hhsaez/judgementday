#ifndef JUDGEMENT_DAY_COMPONENTS_PLAYER_CARD_
#define JUDGEMENT_DAY_COMPONENTS_PLAYER_CARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class PlayerCard : public crimild::NodeComponent {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::PlayerCard )
			
		public:
			explicit PlayerCard( crimild::scripting::ScriptEvaluator & );
			virtual ~PlayerCard( void );

			virtual void start( void ) override;
			virtual void update( const crimild::Clock & ) override;

		private:
			crimild::Node *_player = nullptr;
			crimild::Text *_hp = nullptr;
            crimild::Text *_ap = nullptr;
		};

	}

}

#endif


				
