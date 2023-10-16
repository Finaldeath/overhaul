//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make sure PC's have spoken to Mother Salinka before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////

#include "inc_plot_locals"
int StartingConditional()
{
    if (HasPCSpokenToMotherSalinka(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
