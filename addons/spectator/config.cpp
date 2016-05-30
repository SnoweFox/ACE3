#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"F3 Project","Head","SilentSpike","voiper"};
        authorUrl = "https://github.com/acemod";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"

#include "CBA_Settings.hpp"
#include "ui\interface.hpp"

class CfgRespawnTemplates {
    class ADDON {
        onPlayerKilled = QFUNC(respawnTemplate);
        onPlayerRespawn = QFUNC(respawnTemplate);
    };
};
