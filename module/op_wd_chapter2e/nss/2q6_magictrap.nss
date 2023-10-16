//::///////////////////////////////////////////////
//:: Magic Training Trap
//:: 2Q6_MagicTrap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the local to true for the target dummies
    and spawns in a green slaad
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    object oMage;
    int nLocal = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6C_MAGIC_TRAINING", 1);
    object oWay = GetWaypointByTag("2Q6_Spawn");
    if(GetIsObjectValid(oWay) && nLocal == 0)
    {
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));
        CreateObject(OBJECT_TYPE_CREATURE, "NW_SLAADGRN", GetLocation(oWay));
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
}
