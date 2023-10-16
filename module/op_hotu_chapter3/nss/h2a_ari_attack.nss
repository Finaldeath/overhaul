//::///////////////////////////////////////////////
//:: Aribeth, Post-Thaw Attack (Action Script)
//:: H2a_Ari_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make Aribeth attack the player and fire her
     first combat one-liner.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"
void main()
{
    //Make her attack.
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    DetermineCombatRound();

    //Make her speak one-liner.
    DelayCommand(1.0, SpeakOneLinerConversation());

    //Add journal entry
    AddJournalQuestEntry("XP2_Aribeth", 70, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 65;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
