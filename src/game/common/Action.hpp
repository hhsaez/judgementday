#ifndef JUDGEMENT_DAY_COMMON_ACTION_
#define JUDGEMENT_DAY_COMMON_ACTION_

#include "JudgementDayCommon.hpp"

namespace judgementday {

	class Action : public crimild::SharedObject {
	public:
		Action( crimild::scripting::ScriptEvaluator &eval );
		virtual ~Action( void );

		const std::string &getName( void ) const { return _name; }
		const std::string &getDescription( void ) const { return _description; }

		crimild::Int16 getCost( void ) const { return _cost; }
		crimild::Int16 getDamage( void ) const { return _damage; }
		crimild::Int16 getHP( void ) const { return _hp; }

	private:
		std::string _name;
		std::string _description;
		crimild::Int16 _cost;
		crimild::Int16 _damage;
		crimild::Int16 _hp;
	};

}

#endif

