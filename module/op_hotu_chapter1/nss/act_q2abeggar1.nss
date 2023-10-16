//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Stores that the pc did help the adventurer. The
     beggar will then reappear in the Black Tankard Inn
     in Skullport and pay the pc back with a cool magic item.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    PlayerHelpsAdventurer(GetPCSpeaker());
}
