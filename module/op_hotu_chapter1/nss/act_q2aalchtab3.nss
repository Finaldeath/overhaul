//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives an item to the player and increases thief reputaion.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_o2_coninclude"
void main()
{
    object oPC = (GetPCSpeaker());
    PCIsAThief(GetPCSpeaker());
    CreatePotion(oPC,oPC);
}
