//::///////////////////////////////////////////////
//:: Name hx_ari_freeze
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth frozen, enhancement to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oHench = GetObjectByTag("H2_Aribeth");

    //Journal Entry
    AddJournalQuestEntry("XP2_Name_Aribeth", 60, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 146;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    // Keeps her from speaking after freezing
    SetLocalInt(oHench, "HX_FROZEN", TRUE);

    // Flag the object for removal when area is exited.
    SetLocalInt(oHench, "HX_FLAGGED_DEAD", TRUE);

    // Evil hit.
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    RemoveHenchman(oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oHench);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ICESKIN), oHench);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oPC);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageIncrease(DAMAGE_BONUS_1d12, DAMAGE_TYPE_MAGICAL)), oPC));
}
