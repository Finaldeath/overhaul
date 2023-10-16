//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has shield and int check.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"

int StartingConditional()
{
    object oPC = (GetPCSpeaker());
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"graybansshield")))
        return TRUE;
    return FALSE;
}
