//::///////////////////////////////////////////////
//:: Insane Ranting
//:: 2Q6H_Insane_A
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
    int nRand = d6();
    SetLocalPlotIntOnCharacter(OBJECT_SELF, nRand);
    if(nRand == 1)
    {
        return TRUE;
    }
    return FALSE;
}
