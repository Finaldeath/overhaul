//::///////////////////////////////////////////////
//:: Sensei Dharvana, Informed She Is Sleeping Man's True Love (Action Script)
//:: H2a_Sens_Love_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player tells Sensei Dharvana that she is the
     Sleeping Man's True Love (and she really is).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Flag the Sensei as believing herself to be the Sleeping Man's one true
    //love.
    SetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove", TRUE);

    //Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMansLove", 90, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 199;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
