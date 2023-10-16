//::///////////////////////////////////////////////
//:: Name act_thomas2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create the wedding ring for Thomas's quest on
    the PC speaker and set a variable to show that
    the ring has been given...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 20/03
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q2a1ring", oPC);
    //AddJournalQuestEntry("plotid", nState, oPC);
    SetLocalInt(OBJECT_SELF, "nRingGiven", 1);
    PCKnowsCynnHusband();
}
