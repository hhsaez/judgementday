#ifndef JUDGEMENT_DAY_COMPONENTS_MONSTER_CARD_
#define JUDGEMENT_DAY_COMPONENTS_MONSTER_CARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class MonsterCard : public crimild::NodeComponent {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::MonsterCard )
			
		public:
			explicit MonsterCard( crimild::scripting::ScriptEvaluator & );
			virtual ~MonsterCard( void );

			virtual void start( void ) override;
			virtual void update( const crimild::Clock & ) override;
            
        private:
            crimild::Text *_hp = nullptr;
		};

	}

}

#endif


				
