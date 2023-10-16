#include "x2_inc_treasure"
#include "x2_inc_switches"
// Mod version, item-check.
void main()
{
    // Initialize DTS using the Row identified by 0 in des_conf_treas.2da
    DTSInitialize(1);

    if (GetGameDifficulty() ==  GAME_DIFFICULTY_CORE_RULES || GetGameDifficulty() ==  GAME_DIFFICULTY_DIFFICULT)
    {
        // * Setting the switch below will enable a seperate Use Magic Device Skillcheck for
        // * rogues when playing on Hardcore+ difficulty. This only applies to scrolls
        SetModuleSwitch (MODULE_SWITCH_ENABLE_UMD_SCROLLS, TRUE);
    }

    object oPC = GetFirstPC();

    SetLocalInt(GetModule(), "X2_L_NOTREASURE", 1);

    SetLocalString(GetModule(), "NW_S_VERSION", "5.0");

    //Add initial journal entry
    AddJournalQuestEntry("XP2_Main", 10, oPC, TRUE, TRUE);

    // Allow Henchmen.
    SetMaxHenchmen(3);
}
