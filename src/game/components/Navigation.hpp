#ifndef JUDGEMENT_DAY_COMPONENTS_NAVIGATION_
#define JUDGEMENT_DAY_COMPONENTS_NAVIGATION_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    namespace messaging {
        
        struct BoardReady {
            crimild::Node *board;
            crimild::Node *start;
        };
        
    }

	namespace components {

		class Navigation :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Navigation )
			
		public:
			explicit Navigation( crimild::scripting::ScriptEvaluator & );
			virtual ~Navigation( void );
            
            virtual void start( void ) override;
            
        public:
            virtual void renderDebugInfo( crimild::Renderer *renderer, crimild::Camera *camera ) override;
		};

	}

}

#endif


				
