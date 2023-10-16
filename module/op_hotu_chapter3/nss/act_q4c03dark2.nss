//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives PC history book and sets game done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());
    CreateItemOnObject("q4chistorybook",oPC);
    DarkfistGameDone(oPC);
}
