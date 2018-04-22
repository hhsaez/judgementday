#ifndef JUDGEMENT_DAY_COMPONENTS_ACTION_CARD_
#define JUDGEMENT_DAY_COMPONENTS_ACTION_CARD_

#include "JudgementDayCommon.hpp"

namespace judgementday {
    
    class Action;

	namespace components {

		class ActionCard :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::ActionCard )
			
		public:
			explicit ActionCard( crimild::scripting::ScriptEvaluator & );
			virtual ~ActionCard( void );
            
            virtual void start( void ) override;
            
            void setAction( crimild::SharedPointer< Action > const &action );
            Action *getAction( void ) { return crimild::get_ptr( _action ); }
            
        private:
            crimild::SharedPointer< Action > _action;
            
            crimild::Text *_title = nullptr;
            crimild::Text *_description = nullptr;
            crimild::Text *_cost = nullptr;
		};

	}

}

#endif


				
