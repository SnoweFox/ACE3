/*
 * Author: KoffeinFlummi, commy2
 * Handles all incoming damage for vehicles.
 *
 * Arguments:
 * HandleDamage EH
 *
 * Return Value:
 * Damage to be inflicted.
 *
 * Public: No
 */
#include "script_component.hpp"


// It's already dead, who cares?
if (damage _vehicle >= 1) exitWith {};

if (_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC_F"}) exitWith {

};




