//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets player on plot.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());

    //Set Variable to plot on.
    LookingForCrap(oPC);

    // Give Journal Entry
    AddJournalQuestEntry("poormerchant",10,oPC);
}
