//::///////////////////////////////////////////////
//:: Name hx_slp_slpatk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping man and Sensei attack each other.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMan", 35, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 189;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    object oSleep = GetObjectByTag("H2_SleepingMan");
    object oSensei = GetObjectByTag("H2_Sensei");

    SetPlotFlag(oSleep, FALSE);

    // Sensei attacks Sleeping Man.
    SetIsTemporaryEnemy(oSleep, oSensei);
    AssignCommand(oSensei, ActionAttack(oSleep));

    // Sleeping Man attacks Sensei.
    SetIsTemporaryEnemy(oSensei, oSleep);
    AssignCommand(oSleep, ActionEquipMostDamagingMelee());
    DelayCommand(0.5, AssignCommand(oSleep, ActionAttack(oSensei)));
}
