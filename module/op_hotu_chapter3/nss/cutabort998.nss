//::///////////////////////////////////////////////
//:: Name cutabort998
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Ending cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 9, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //object oPC = GetLastPCToCancelCutscene();

    // Fix: Clear cursed flag on all items.
    // This is so that when people take their character into a different module,
    // they are able to get rid of the items.
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        BlackScreen(oPC);
        object oItem = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oItem))
        {
            SetItemCursedFlag(oItem, FALSE);
            oItem = GetNextItemInInventory(oPC);
        }
        oPC = GetNextPC();
    }

    ExportAllCharacters();
    DelayCommand(0.8,EndGame("XP2_Closing"));
}
