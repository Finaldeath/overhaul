//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give Player Key and set house entered.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oHousekey = (GetObjectByTag("q4chousekey"));
    object oPC = (GetPCSpeaker());
    ActionGiveItem(oHousekey,oPC);
    PCEntersOnusHouse(oPC);
}
