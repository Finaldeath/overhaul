//::///////////////////////////////////////////////
//:: FileName q4a_ear3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/15/2003 1:17:24 PM
//:://////////////////////////////////////////////
//#include "nw_i0_tool"
#include "nw_i0_plot"
void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("q4a_gargs", 50, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 123;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "gargoyle_ear");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    // Set the variables
    SetLocalInt(OBJECT_SELF, "q4a_gong_ear", 3);

}
