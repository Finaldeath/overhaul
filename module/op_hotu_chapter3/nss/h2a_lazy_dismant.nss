//::///////////////////////////////////////////////
//:: Lazy the Imp, Dismantle Grinder (Action Script)
//:: H2a_Lazy_Dismant.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Dismantle the Grinder and offer a Good
     alignment shift.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void ClearLazy()
{
    object oLazy = GetObjectByTag("H2_LazyBody");
    object oPC = GetPCSpeaker();

    effect eEffect = GetFirstEffect(oLazy);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oLazy, eEffect);
        eEffect = GetNextEffect(oLazy);
    }
    DelayCommand(0.2, AssignCommand(oLazy, SetFacingPoint(GetPosition(oPC))));
}

void main()
{
    //Dismantle Grinder
    object oGrinder = GetObjectByTag("QuarryGrinder5");
    SetLocalInt(oGrinder, "bDismantled", TRUE);

    //Flag Lazy as no longer being caught in the gears.
    SetLocalInt(oGrinder, "bImpInGrinder", FALSE);
    SetLocalInt(GetModule(), "HX_LAZY_AWAKE", TRUE);
    ClearLazy();

    //Assign a small Good alignment shift
    object oPC = GetPCSpeaker();
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 3);

    //Add journal entry
    AddJournalQuestEntry("XP2_Quarry", 30, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 101;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
