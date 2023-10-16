#include "x2_inc_switches"
#include "x2_inc_treasure"
void main()
{
    SetMaxHenchmen(4);
    SetLocalString(GetModule(), "NW_S_VERSION", "2.44");

    if (GetGameDifficulty() ==  GAME_DIFFICULTY_CORE_RULES || GetGameDifficulty() ==  GAME_DIFFICULTY_DIFFICULT)
    {
        // * Setting the switch below will enable a seperate Use Magic Device Skillcheck for
        // * rogues when playing on Hardcore+ difficulty. This only applies to scrolls
        SetModuleSwitch (MODULE_SWITCH_ENABLE_UMD_SCROLLS, TRUE);
    }

     // Initialize DTS using the Row identified by 1 in des_conf_treas.2da
    DTSInitialize(1);
}


