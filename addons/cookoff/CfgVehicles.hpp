
class CfgVehicles {
    class Sound;
    class ACE_Sound_CookOff: Sound {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_Sound_CookOff";
        scope = 1;
        sound = "ACE_CookOff";
    };

    /*
     * ACE_Cookoff_ammoLocation:
     *   HitPoint classname that holds the magazine of the vehicle
     * ACE_Cookoff_effectLocations[]:
     *   Positions to spawn cookoff particle effects at
     * ACE_Cookoff_effectOnTurret[]:
     *   Positions placed on turret?
     */

    class Tank_F;
    class MBT_01_base_F: Tank_F {
        GVAR(ammoLocation) = "HitHull";
        GVAR(effectLocations)[] = {{-0.3,-0.3,1.8}};
        GVAR(effectOnTurret)[] = {1};
    };
    class MBT_01_arty_base_F: MBT_01_base_F {
        GVAR(effectLocations)[] = {{0.7,-0.3,3.5}};
        GVAR(effectOnTurret)[] = {1};
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        GVAR(effectLocations)[] = {{0,-0.3,1.65}};
        GVAR(effectOnTurret)[] = {0};
    };

    class MBT_02_base_F: Tank_F {
        GVAR(effectLocations)[] = {{-0.6,-0.3,1.65}, {0.5,-0.3,1.65}};
        GVAR(effectOnTurret)[] = {1, 1};
    };
    class MBT_02_arty_base_F: MBT_02_base_F {
        GVAR(effectLocations)[] = {{0.7,-0.3,3.5}};
        GVAR(effectOnTurret)[] = {1};
    };

    class APC_Tracked_01_base_F: Tank_F {
        GVAR(ammoLocation) = "HitHull";
        GVAR(effectLocations)[] = {{0.5,-0.3,1.3}};
        GVAR(effectOnTurret)[] = {0};
    };

    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        GVAR(effectLocations)[] = {{-0.4,-0.3,1.9}, {0.3,-0.3,1.9}};
        GVAR(effectOnTurret)[] = {1, 1};
    };

    class APC_Tracked_02_base_F: Tank_F {
        GVAR(effectLocations)[] = {{0,-0.5,1.65}};
        GVAR(effectOnTurret)[] = {1};
    };

    class O_APC_Tracked_02_base_F;
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        GVAR(effectLocations)[] = {{-0.4,0.2,3.6}, {0.3,0.2,3.6}};
        GVAR(effectOnTurret)[] = {1, 1};
    };

    class APC_Tracked_03_base_F: Tank_F {
        GVAR(effectLocations)[] = {{-0.4,-0.3,1.5}, {0.7,-0.3,1.5}};
        GVAR(effectOnTurret)[] = {1, 1};
    };

    class Wheeled_APC_F;
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        GVAR(effectLocations)[] = {{-0.3,0,1.85}, {0.3,0,1.85}};
        GVAR(effectOnTurret)[] = {1, 1};
    };

    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        GVAR(ammoLocation) = "HitHull";
        GVAR(effectLocations)[] = {{0,-0.4,1}};
        GVAR(effectOnTurret)[] = {0};
    };

    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        GVAR(effectLocations)[] = {{0,-0.6,0}};
        GVAR(effectOnTurret)[] = {0};
    };
};
