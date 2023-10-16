//::///////////////////////////////////////////////
//:: Name act_q1hblake_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nasty PC kills Adam...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();

    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.5));

    effect eDeath = EffectDeath();
    effect eVis = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    effect eLink = EffectLinkEffects(eDeath, eVis);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oBlake));
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);
}
