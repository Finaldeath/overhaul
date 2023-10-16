//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Takes 100 gold from the pc.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    GiveGoldToCreature(GetPCSpeaker(),30);
    MotherSalinkaHatesPCs(GetPCSpeaker());
    MotherSalinkaHatesPC(GetPCSpeaker());
}
