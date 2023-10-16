//::///////////////////////////////////////////////
//:: Name hx_dek_freeze
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Deekin explodes, enhancement to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("hx_hen_deekin", oPC);;
    location lLoc = GetLocation(oHench);

    //Journal Entry
    AddJournalQuestEntry("XP2_Name_Deekin", 40, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 152;
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

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc);

    DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), lLoc));
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oHench));

    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oPC));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC));
    //DestroyObject(oHench, 2.5);
}
