//::///////////////////////////////////////////////
//:: m3q2f_door3A
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
    object oWay = GetNearestObjectByTag("WP_M3Q2F_DOOR3A");
    DoDoorJump(oWay, oPC);
}
