//::///////////////////////////////////////////////
//:: Damas takes the blankets and gives the player 100 gold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

void main()
{
    TakePlagueBlankets(GetPCSpeaker()); // destroys them so player cannot reenter the conversation.
    RewardGP(100,GetPCSpeaker(),FALSE);
}

