#ifndef JUDGEMENT_DAY_COMPONENTS_BOARD_
#define JUDGEMENT_DAY_COMPONENTS_BOARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    class Action;

    namespace messaging {
        
        struct BoardReady {
            crimild::Node *board;
        };
        
        struct CombatBegan {};

		struct BeginPlayerTurn {};
		struct BeginPlayerUnkeep {};
		struct PlayerDrawCard {};
		struct EndPlayerUnkeep {};
		struct BeginPlayerMainPhase {};
        struct PlayerSelectedAction { Action *action; };
        struct PlayerDidAttack { crimild::Int16 damage; };
        struct PlayerExecutedAction {};
		struct EndPlayerMainPhase {};
		struct EndPlayerTurn {};
        struct PlayerKilled {};
        
        struct BeginMonsterTurn {};
        struct MonsterDidAttack { crimild::Int16 damage; };
        struct MonsterKilled {};
        struct EndMonsterTurn {};
        
        struct CombatEnded {};
        
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
                
        private:
            void startCombat( void );
		};

	}

}

#endif


				
