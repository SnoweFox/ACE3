/*
 * Author: Dslyecxi, Jonpas
 * Throw selected throwable.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * unit call ace_advancedthrowing_fnc_throw
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Prime the throwable if it hasn't been cooking already
// Next to proper simulation this also has to happen before delay for orientation of the throwable to be set
if (!GVAR(primed)) then {
    [_unit] call FUNC(prime);
};

_unit playAction "ThrowGrenade";

// Pass position to reset later because animation may change it in certain stances
[{
    params ["_unit", "_activeThrowable", "_posThrown", "_throwType", "_throwSpeed", "_dropMode"];

    // Reset position in case animation changed it
    _activeThrowable setPosASL _posThrown;

    // Launch actual throwable
    private _direction = [THROWSTYLE_NORMAL_DIR, THROWSTYLE_HIGH_DIR] select (_throwType == "high" || {_dropMode});
    private _velocity = [_throwSpeed, _throwSpeed / THROWSTYLE_HIGH_VEL_COEF] select (_throwType == "high");
    _velocity = [_velocity, THROWSTYLE_DROP_VEL] select _dropMode;

    private _p2 = (eyePos _unit) vectorAdd (positionCameraToWorld _direction) vectorDiff (positionCameraToWorld [0, 0, 0]);
    private _p1 = AGLtoASL (_activeThrowable modelToWorldVisual [0, 0, 0]);

    private _newVelocity = (_p1 vectorFromTo _p2) vectorMultiply _velocity;

    // Adjust for throwing from inside vehicles, where we have a vehicle-based velocity that can't be compensated for by a human
    if (vehicle _unit != _unit) then {
        _newVelocity = _newVelocity vectorAdd (velocity (vehicle _unit));
    };

    // Drop if unit dies during throw process
    if (alive _unit) then {
        _activeThrowable setVelocity _newVelocity;
    };
}, [_unit, GVAR(activeThrowable), getPosASLVisual GVAR(activeThrowable), GVAR(throwType), GVAR(throwSpeed), GVAR(dropMode)], 0.3] call CBA_fnc_waitAndExecute;

// Stop rendering arc and doing rendering magic while throw is happening
[_unit, "Completed a throw fully"] call FUNC(exitThrowMode);
