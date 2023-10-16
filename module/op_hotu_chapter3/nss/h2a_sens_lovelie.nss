//::///////////////////////////////////////////////
//:: Sensei Dharvana, Lied To About Sleeping Man's True Love (Action Script)
//:: H2a_Sens_LoveLie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player lies to the Sensei about the identity
     of the Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Sensei is convinced that she is not the Sleeping Man's one true love
    SetLocalInt(OBJECT_SELF, "bThinksSheIsNotSleepingMansTrueLove", TRUE);

    //If she is his one true love, add the proper journal entry.
    object oPC = GetPCSpeaker();
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Sensei")
    {
        AddJournalQuestEntry("XP2_Name_SMansLove", 110, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 201;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
