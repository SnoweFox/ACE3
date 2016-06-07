/*
 * Author: PabstMirror, Jonpas
 * When interact_menu starts rendering (from "interact_keyDown" event).
 * Add pick up helpers to all nearby grenades.
 *
 * Arguments:
 * 0: Interaction Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [0] call ace_advancedthrowing_fnc_interactEH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_interactionType"];

// Ignore self-interaction menu and when in vehicle
if (_interactionType != 0 || {vehicle ACE_player != ACE_player}) exitWith {};

[{
    params ["_args", "_idPFH"];
    _args params ["_setPosition", "_addedPickUpHelpers", "_throwablesHelped"];

    if (EGVAR(interact_menu,keyDown)) then {
        // Prevent rare error when ending mission with interact key down
        if (isNull ACE_player) exitWith {};

        // Player moved >5 meters from last pos, rescan
        if ((getPosASL ACE_player) distance _setPosition > 5 && {!GVAR(inHand)}) then {
            {
                if (_x distance ACE_player > 5 || {_x in _throwablesHelped}) exitWith {};
                if (!GVAR(enablePickUpAttached) && {!isNull (attachedTo _x)}) exitWith {};

                private _pickUpHelper = QGVAR(pickUpHelper) createVehicleLocal (getPos _x);

                TRACE_3("Made PickUp Helper",_x,typeOf _x);

                _pickUpHelper attachTo [_x, [0, 0, 0]];
                _pickUpHelper setVariable [QGVAR(throwable), _x];
                _addedPickUpHelpers pushBack _pickUpHelper;
                _throwablesHelped pushBack _x;
            } forEach ((ACE_player nearObjects ["GrenadeHand", 5]) + (ACE_player nearObjects ["GrenadeCore", 5]));
            _args set [0, getPosASL ACE_player];
        };
    } else {
        TRACE_1("Cleaning Pick Up Helpers",count _addedPickUpHelpers);
        {deleteVehicle _x} forEach _addedPickUpHelpers;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [(getPosASL ACE_player) vectorAdd [-100,0,0], [], []]] call CBA_fnc_addPerFrameHandler;
