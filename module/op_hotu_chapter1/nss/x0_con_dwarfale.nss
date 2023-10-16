//::///////////////////////////////////////////////
//:: x0_con_dwarfAle
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    returns true if can afford the ale
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_func"

int StartingConditional()
{
    int iResult;
    object oTalker = GetPCSpeaker();
    if (GetIsObjectValid(oTalker) == FALSE)
    {
        oTalker = GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    }
    iResult = GetGold(oTalker) >= PLOT_COST_ALE ;
    return iResult;
}
