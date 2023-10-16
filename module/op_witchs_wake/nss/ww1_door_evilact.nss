//::///////////////////////////////////////////////
//:: Witch Wake 1: Door, Evil Act
//:: WW1_Door_EvilAct.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Any paladin bashing or unlocking this door
     will lose their paladin status.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetLastUnlocked();

    //If the door was bashed instead of unlocked, get the last basher.
    if (oPC == OBJECT_INVALID)
    {
        oPC = GetLastDamager();
    }

    //Handle any paladin falling that may result.
    PaladinFalls(oPC);
}
