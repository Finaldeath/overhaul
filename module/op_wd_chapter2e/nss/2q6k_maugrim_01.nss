//::///////////////////////////////////////////////
//:: Makes Maugrim cast a spell on Aribeth.
//:: 2q6k_maugrim_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes Maugrim change aribeth into a blackguard
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oAribeth = GetNearestObjectByTag("2Q6K_Aribeth");
    object oMaugrim = GetNearestObjectByTag("2Q6K_Maugrim");
    //AssignCommand(oMaugrim, ActionCastFakeSpellAtObject(SPELL_WEIRD, oAribeth));
    ActionCastFakeSpellAtObject(SPELL_WEIRD, oAribeth);

    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);

    DelayCommand(1.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oAribeth));
}
