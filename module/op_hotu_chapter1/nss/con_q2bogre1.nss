//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if PC knows about Ogre && nymph war.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: June 19/03
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (PCKnowsOfOgreFairyWar(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
