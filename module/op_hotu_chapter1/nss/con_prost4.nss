//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if PC refused to pay prostitute.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 23, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (ProstituteIsInsulted(GetTag(OBJECT_SELF), GetPCSpeaker()) == TRUE)
        return TRUE;
    return FALSE;
}
