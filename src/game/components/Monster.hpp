#ifndef JUDGEMENT_DAY_COMPONENTS_MONSTER_
#define JUDGEMENT_DAY_COMPONENTS_MONSTER_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    namespace messaging {
        
        struct SpawnMonster { };
        
    }

	namespace components {
        
		class Monster :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Monster )
			
		public:
            Monster( void );
			explicit Monster( crimild::scripting::ScriptEvaluator & );
			virtual ~Monster( void );
                
            virtual void start( void ) override;
            virtual void update( const crimild::Clock & ) override;
                
        private:
            void onHit( crimild::Int16 damage );
		};

	}

}

#endif


				
