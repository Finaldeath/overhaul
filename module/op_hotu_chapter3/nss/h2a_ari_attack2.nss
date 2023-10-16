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
//:: Edited By: Brad Prince
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"
void main()
{
    //SendMessageToPC(GetFirstPC(), "ABORT FIRED");
    if(GetLocalInt(GetModule(), "HX_ARIBETH_ATTACKS") == TRUE)
    {
        SetLocalInt(GetModule(), "HX_ARIBETH_ATTACKS", FALSE);
        //Make her attack.
        object oPC = GetPCSpeaker();
        //AdjustReputation(oPC, OBJECT_SELF, -100);
        ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
        DetermineCombatRound();

        // DEBUG
       // SendMessageToPC(GetFirstPC(), "ABORT FIRED");

        //Make her speak one-liner.
        DelayCommand(1.0, SpeakOneLinerConversation());
        SetLocalInt(OBJECT_SELF, "bPreAttackDoOnce", TRUE);
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
}
