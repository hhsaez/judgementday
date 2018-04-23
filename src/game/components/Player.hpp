#ifndef JUDGEMENT_DAY_COMPONENTS_PLAYER_
#define JUDGEMENT_DAY_COMPONENTS_PLAYER_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    class Action;
    
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
            public crimild::Messenger,
            public crimild::DynamicSingleton< Player > {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Player )
			
		public:
			explicit Player( crimild::scripting::ScriptEvaluator & );
			virtual ~Player( void );
                
            virtual void start( void ) override;
                
            void setCurrentWaypoint( crimild::Node *wp ) { _currentWaypoint = wp; }
            crimild::Node *getCurrentWaypoint( void ) { return _currentWaypoint; }
                
            void loot( crimild::containers::Array< crimild::SharedPointer< Action >> &actions );
                
        private:
            void onTurnBegan( void );
            void onActionSelected( Action *action );
            void onHit( crimild::Int16 damage );
                
        private:
            Board *_board = nullptr;
            Navigation *_navigation = nullptr;
            crimild::Node *_currentWaypoint = nullptr;
		};

	}

}

#endif


				
