// The End.
#include "achievement_lib"

void main()
{
    // Fix: Clear cursed flag on all items.
    // This is so that when people take their character into a different module,
    // they are able to get rid of the items.
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        PlotAchievement(oPC, 6);
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
