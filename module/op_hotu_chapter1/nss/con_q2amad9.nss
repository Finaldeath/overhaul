//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make sure PC's haven't tried to steal here before
     before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////

#include "inc_plot_locals"
int StartingConditional()
{
    if (IsMotherSalinkaMadAtPC(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
