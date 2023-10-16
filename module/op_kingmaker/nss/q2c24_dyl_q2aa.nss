//::///////////////////////////////////////////////
//:: q2c24_dyl_q2aa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the player and henchmen to the next cutscene
*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:: Modified by Cori, August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("kmcut3_PC1");
    object oPC = GetFirstPC();

    os_MoveParty(oWay, oPC);
}

