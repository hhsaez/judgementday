#ifndef JUDGEMENT_DAY_COMPONENTS_ACTOR_
#define JUDGEMENT_DAY_COMPONENTS_ACTOR_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	class Action;
    
	namespace components {
        
		class Actor :
            public crimild::NodeComponent,
            public crimild::Messenger {
			CRIMILD_IMPLEMENT_RTTI( judgementday::components::Actor )
			
		private:
			using ActionArray = crimild::containers::Array< crimild::SharedPointer< Action >>;
            using ActionStack = crimild::containers::Stack< crimild::SharedPointer< Action >>;
			
		public:
			explicit Actor( crimild::scripting::ScriptEvaluator & );
			virtual ~Actor( void );

            virtual void start( void ) override;
			virtual void update( const crimild::Clock & ) override;
                
            const std::string &getName( void ) const { return _name; }
            const std::string &getDescription( void ) const { return _description; }
			
			void setHP( crimild::Int16 hp ) { _hp = hp; }
			crimild::Int16 getHP( void ) const { return _hp; }
			
			void setMaxHP( crimild::Int16 maxHP ) { _maxHP = maxHP; }
			crimild::Int16 getMaxHP( void ) const { return _maxHP; }
			
			void setAP( crimild::Int16 ap ) { _ap = ap; }
			crimild::Int16 getAP( void ) const { return _ap; }
			
			void setMaxAP( crimild::Int16 maxAP ) { _maxAP = maxAP; }
			crimild::Int16 getMaxAP( void ) const { return _maxAP; }
			
			ActionArray &getHand( void ) { return _hand; }
                
            void addActionsToDeck( ActionArray &actions );
            bool drawCard( crimild::Int16 maxHandSize );
            void discard( Action *action );
                
        private:
            ActionStack &getStack( void ) { return _stack; }
            ActionArray &getDeck( void ) { return _deck; }
            ActionArray &getDiscarded( void ) { return _discarded; }
                
            void onCombatBegan( void );
			
		private:
            std::string _name;
            std::string _description;
			crimild::Int16 _hp;
			crimild::Int16 _maxHP;
			crimild::Int16 _ap;
			crimild::Int16 _maxAP;
			
			ActionArray _deck;
			ActionArray _hand;
			ActionArray _discarded;
            ActionStack _stack;
                
            crimild::Real64 _timer = 0.0f;
		};

	}

}

#endif


				
