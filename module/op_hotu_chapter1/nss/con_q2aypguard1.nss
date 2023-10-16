//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Grayban should allow PC down well.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
        if (GetLocalInt(GetModule(),"NW_WELLROOMOPEN")==10)
               return TRUE;
        return FALSE;
}
