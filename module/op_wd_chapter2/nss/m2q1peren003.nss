//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren003
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren dies.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints()),OBJECT_SELF);
}
