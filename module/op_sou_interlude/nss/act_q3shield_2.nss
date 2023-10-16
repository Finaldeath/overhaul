//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Shield Guardian breaks and lets PC do whatever he wants.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 14, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_Q3SHIELDGUARDIAN",20);
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
}
