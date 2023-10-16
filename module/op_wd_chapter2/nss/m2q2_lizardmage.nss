//::///////////////////////////////////////////////
//:: Opened or Death
//:: m2q2_LizardMage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have the Lizard mage teleport to the door.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////

void main()
{
    object oLizard = GetObjectByTag("M2Q2CE_LIZWIZ2");
    object oWaypoint = GetWaypointByTag("WP_LIZARD_MAGE");
    location lWaypoint = GetLocation(oWaypoint);

    if (GetLocalInt(OBJECT_SELF,"NW_L_Summon") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Summon",1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),lWaypoint);
        AssignCommand(oLizard,ActionJumpToLocation(lWaypoint));
    }
}
