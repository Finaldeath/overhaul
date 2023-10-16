//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2f_altar006
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gets diseased.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE),oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectDisease(DISEASE_BLINDING_SICKNESS),oPC);
}
