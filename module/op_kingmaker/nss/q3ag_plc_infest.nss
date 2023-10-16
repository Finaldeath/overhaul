//::///////////////////////////////////////////////
//:: Diseased Corpse
//:: q3ag_plc_infest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The corpse casts disease on the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 7, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    //was Vermin madness, but mindfire seems less damaging
    effect eMindfire = EffectDisease(DISEASE_MINDFIRE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eMindfire, oPC);
}
