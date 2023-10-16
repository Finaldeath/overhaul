//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adam dies
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 3/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();

    //AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.5));

    effect eDeath = EffectDeath();
    effect eVis = EffectVisualEffect(VFX_COM_BLOOD_CRT_RED);
    effect eLink = EffectLinkEffects(eDeath, eVis);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oBlake));

}

