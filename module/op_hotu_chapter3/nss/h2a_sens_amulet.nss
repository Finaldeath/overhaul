//::///////////////////////////////////////////////
//:: Githzerai Sensei, Mysteries Completed, Give Amulet (Condition Script)
//:: H2a_Sens_Amulet.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the Five-Fold Mysteries as being
     completed and give the player a copy of the
     amulet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Flag the Mysteries as complete
    SetLocalInt(GetModule(), "bMysteriesComplete", TRUE);

    //Spawn in an amulet for the player.
    object oPC = GetPCSpeaker();
    SignalEvent(OBJECT_SELF, EventUserDefined(4444));

    //Add journal entry
    AddJournalQuestEntry("XP2_Pilgrims", 100, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 92;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
