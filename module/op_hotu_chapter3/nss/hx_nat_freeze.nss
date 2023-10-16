//::///////////////////////////////////////////////
//:: Name hx_nat_freeze
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Nathyrra frozen, enhancement to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("hx_hen_nathyra", oPC);
    location lLoc = GetLocation(oHench);

    //Journal Entry
    AddJournalQuestEntry("XP2_Name_Nathyrra", 40, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 177;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    // Evil hit.
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    // Flag the object for removal when area is exited.
    SetLocalInt(oHench, "HX_FLAGGED_DEAD", TRUE);

    RemoveHenchman(oPC, oHench);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oHench);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PROT_STONESKIN), oHench);

    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc));
    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oHench));

    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oPC));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageReduction(10, DAMAGE_POWER_NORMAL)), oPC));
}
