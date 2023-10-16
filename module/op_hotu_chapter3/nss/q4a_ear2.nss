//::///////////////////////////////////////////////
//:: FileName q4a_ear1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/15/2003 1:07:49 PM
//:://////////////////////////////////////////////
//#include "nw_i0_tool"
#include "nw_i0_plot"
void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    object oPC = GetPCSpeaker();
    oItemToTake = GetFirstItemInInventory(oPC);

    //Journal entry
    AddJournalQuestEntry("q4a_gargs", 50, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 123;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }


    int iEar = 0;

    while(oItemToTake != OBJECT_INVALID && iEar < 2) {
        if(GetTag(oItemToTake) == "gargoyle_ear") {
           DestroyObject(oItemToTake);
           iEar = iEar + 1;
        }
        oItemToTake = GetNextItemInInventory(oPC);
    }
    // Set the variables
    SetLocalInt(OBJECT_SELF, "q4a_gong_ear", 3);

}
