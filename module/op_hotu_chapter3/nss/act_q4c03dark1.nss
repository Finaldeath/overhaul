//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives PC key to castle and sets game on.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());
    CreateItemOnObject("q4ccastlekey",oPC);
    DarkfistGameOn(oPC);
}
