//::///////////////////////////////////////////////
//:: Name  con_cynn_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If PC has been given the Cynn quest by Thomas
    and has the ring - return TRUE;
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////

#include "inc_plot_locals"
int StartingConditional()
{
    if (DoesPCKnowCynnHusband())
        return TRUE;
    return FALSE;
}
