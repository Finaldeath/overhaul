//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Did someone already buy Argali's special item?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (ArgaliSoldItem(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
