#ifndef JUDGEMENT_DAY_COMPONENTS_PLAYER_
#define JUDGEMENT_DAY_COMPONENTS_PLAYER_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    namespace messaging {
        
        struct SpawnPlayer {
            crimild::Node *board;
        };
        
    }

	namespace components {
        
        class Board;
        class Navigation;

		class Player :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Player )
			
		public:
			explicit Player( crimild::scripting::ScriptEvaluator & );
			virtual ~Player( void );
                
            virtual void start( void ) override;
                
            void setCurrentWaypoint( crimild::Node *wp ) { _currentWaypoint = wp; }
            crimild::Node *getCurrentWaypoint( void ) { return _currentWaypoint; }
                
        private:
            Board *_board = nullptr;
            Navigation *_navigation = nullptr;
            crimild::Node *_currentWaypoint = nullptr;
		};

	}

}

#endif


				
