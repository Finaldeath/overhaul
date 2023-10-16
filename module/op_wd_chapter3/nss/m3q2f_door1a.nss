//::///////////////////////////////////////////////
//:: m3q2f_door1a
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
    object oWay = GetNearestObjectByTag("WP_M3Q2F_DOOR1A");
    DoDoorJump(oWay, oPC);
}
