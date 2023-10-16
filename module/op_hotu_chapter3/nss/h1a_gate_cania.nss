//::///////////////////////////////////////////////
//:: Gatekeeper, Open the Gate into Cania (Action Script)
//:: H1a_Gate_Cania.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has discussed the nature of True
     Names with the Gatekeeper and the door to
     Cania can now be unlocked.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Unlock the door
    object oDoor = GetObjectByTag("Gates_City");
    SetLocked(oDoor, FALSE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 20, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 78;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
