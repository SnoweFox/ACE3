#include "script_component.hpp"

// all vehicles, except persons and animals
["AllVehicles", "handleDamage", FUNC(cookOff), nil, ["Man"]] call CBA_fnc_addClassEventHandler;
