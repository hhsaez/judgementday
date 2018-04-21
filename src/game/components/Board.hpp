#ifndef JUDGEMENT_DAY_COMPONENTS_BOARD_
#define JUDGEMENT_DAY_COMPONENTS_BOARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {

    namespace messaging {
        
        struct BoardReady {
            crimild::Node *board;
        };
        
    }
    
	namespace components {

		class Board :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Board )
			
		public:
			explicit Board( crimild::scripting::ScriptEvaluator & );
			virtual ~Board( void );
                
            virtual void start( void ) override;
		};

	}

}

#endif


				
