//::///////////////////////////////////////////////
//:: Name hx_slp_wake
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man wakes, thinks PC is love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void hx_RemoveEffects(object oSleep);
void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    int i2daRow;
    int bDuplicate;

    object oSensei = GetObjectByTag("H2_Sensei");

    if(GetIsObjectValid(oSensei) && !GetIsDead(oSensei))
    {
        SetLocalInt(GetModule(), "bSenseiJumped", TRUE);
        ActionPauseConversation();
        DelayCommand(1.0, ActionResumeConversation());
        location lSensei = GetLocation(GetObjectByTag("hx_temple_sensei_wp"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lSensei);
        AssignCommand(oSensei, ClearAllActions(TRUE));
        AssignCommand(oSensei, ActionJumpToLocation(lSensei));
    }


    // Set variables.
    SetLocalString(GetModule(), "sSleepingManThinksLoveIs", "Player");
    // Variable is not really dead, just means the invis object willnot start a conv
    // now that he is awake or gone.
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    //Add Journal Entries
    string sThinkLove = GetLocalString(GetModule(), "sSleepingManThinksLoveIs");
    string sTrueLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sThinkLove == sTrueLove) //Player told truth
    {
        AddJournalQuestEntry("XP2_Name_SMansLove", 80, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 198;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
    if (sThinkLove != sTrueLove) //Player told lie
    {
        AddJournalQuestEntry("XP2_Name_SMansLove", 100, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 200;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }

    // Wake the Sleeping Man.
    SetLocalInt(oSleep, "bAwake", TRUE);
    hx_RemoveEffects(oSleep);
}

void hx_RemoveEffects(object oSleep)
{
    effect eEffect = GetFirstEffect(oSleep);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oSleep, eEffect);
        eEffect = GetNextEffect(oSleep);
    }
}
