//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Has pc met Cynn, but not accepted the plot?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (HasPCMetCynnBefore(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
