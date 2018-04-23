#ifndef JUDGEMENT_DAY_COMPONENTS_UI_EVENT_BUTTON_
#define JUDGEMENT_DAY_COMPONENTS_UI_EVENT_BUTTON_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace messaging {

		struct UIEvent {
			std::string eventName;
		};

	}

	namespace components {

		class UIEventButton :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::UIEventButton )
			
		public:
            explicit UIEventButton( std::string eventName );
			explicit UIEventButton( crimild::scripting::ScriptEvaluator & );
			virtual ~UIEventButton( void );
                
            virtual void onAttach( void ) override;

		private:
			std::string _eventName;
		};

	}

}

#endif


				
