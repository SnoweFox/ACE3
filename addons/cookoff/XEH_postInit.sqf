#include "script_component.hpp"

["Tank_F", "handleDamage", FUNC(handleDamageTank)] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "handleDamage", FUNC(handleDamageTank)] call CBA_fnc_addClassEventHandler;
