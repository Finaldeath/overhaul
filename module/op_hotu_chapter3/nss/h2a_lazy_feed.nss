//::///////////////////////////////////////////////
//:: Lazy the Imp, Feed Through (Action Script)
//:: H2a_Lazy_Feed.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Feeds Lazy through the Grinder, thereby
     reactivating it. Evil alignment shift.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Destroy Lazy
    DestroyObject(OBJECT_SELF);
    object oBody = GetObjectByTag("H2_LazyBody");
    AssignCommand(oBody, SetIsDestroyable(TRUE, FALSE, FALSE));
    DestroyObject(oBody, 2.0);

    //Apply gore VFX to Grinder
    effect eChunks = EffectVisualEffect(VFX_COM_CHUNK_RED_MEDIUM);
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oBody);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eChunks, oGrinder5);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eChunks, oGrinder5));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eChunks, oGrinder5));

    //Reactivate Grinder
    SetLocalInt(oGrinder5, "bImpInGrinder", FALSE);
    SetLocalInt(oGrinder5, "bActivated", TRUE);
    SetLocalInt(oGrinder5, "bDismantled", FALSE);
    SetLocalInt(oGrinder5, "bQuestComplete", TRUE);

    //Shift alignment toward evil
    object oPC = GetPCSpeaker();
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    //Add journal entry
    AddJournalQuestEntry("XP2_Quarry", 80, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 103;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
