//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2f_altar007
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gets poisoned.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_ACID_L),oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectPoison(POISON_NIGHTSHADE),oPC);
}
