//::///////////////////////////////////////////////
//:: PC Lies to Gods
//:: act_dyn_swornlie
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC lies to the gods, is hit by damage and red effect
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nDam = GetCurrentHitPoints(oPC)/5;
    effect eDam = EffectDamage(nDam);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oPC);
}
