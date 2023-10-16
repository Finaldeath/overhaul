//::///////////////////////////////////////////////
//:: Used
//:: 2q6_maug_portal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The portal in Maugrim's Lair will teleport
    the PC back to Luskan, near the Host Tower
    entrance.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oWaypoint = GetObjectByTag("WP_Maugrim_Exit");

    location lPC = GetLocation(oPC);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),lPC);
    DelayCommand(1.0,AssignCommand(oPC,JumpToObject(oWaypoint)));
}
