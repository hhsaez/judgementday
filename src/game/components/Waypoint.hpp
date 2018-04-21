#ifndef JUDGEMENT_DAY_COMPONENTS_WAYPOINT_
#define JUDGEMENT_DAY_COMPONENTS_WAYPOINT_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	namespace components {

		class Waypoint : public crimild::NodeComponent {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Waypoint )
			
		public:
			explicit Waypoint( crimild::scripting::ScriptEvaluator & );
			virtual ~Waypoint( void );
            
            void setNext( crimild::Node *next ) { _next = next; }
            crimild::Node *getNext( void ) { return _next; }
            
        private:
            crimild::Node *_next = nullptr;
		};

	}

}

#endif


				
