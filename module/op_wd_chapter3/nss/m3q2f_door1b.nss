//::///////////////////////////////////////////////
//:: m3q2f_door1B
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the person across to the other side of the door
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////
#include "m3plotinclude"

void main()
{
    object oPC = GetEnteringObject();
    object oWay = GetNearestObjectByTag("WP_M3Q2F_DOOR1B");
    DoDoorJump(oWay, oPC);
    if (GetTag(oPC) == "M3Q2FGolem0"
        || GetTag(oPC) == "M3Q2FGolem1"
        || GetTag(oPC) == "M3Q2FGolem2"
        || GetTag(oPC) == "M3Q2FGolem3"
        || GetTag(oPC) == "M3Q2FGolem4")
    {
        AssignCommand(oPC,ClearAllActions());
        object oGolem = GetNearestObjectByTag("M3Q2FGOLEMSPWN3");
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oPC,1.0);
        DelayCommand(1.0,AssignCommand(oPC,JumpToObject(oGolem)));
    }
}
