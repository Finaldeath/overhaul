//::///////////////////////////////////////////////
//:: Wrong Key
//:: act_q3c_wrongkey
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC chose the wrong key
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oWay = GetObjectByTag("q3ac_way_shell");
    int nDam = GetCurrentHitPoints(oPC)/20;
    effect eDam = EffectDamage(nDam);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oPC);
    os_MoveParty(oWay,oPC);
//    q3_JumpToDoor("q3ac_way_shell");
}
