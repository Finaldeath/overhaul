//::///////////////////////////////////////////////
//:: Insane Ranting
//:: 2Q6H_Insane_G
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the random int that lets the prisoner
    rant and rave.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 1, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
int StartingConditional()
{
    int nRand = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);

    if(nRand == 6 && GetIsObjectValid(oPC))
    {
        return TRUE;
    }
    return FALSE;
}


