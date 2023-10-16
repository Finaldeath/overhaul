//::///////////////////////////////////////////////
//:: q4c_aghaaz99x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Sets Aghaaz global to 99 (gave Aghaaz Ferron's head)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"
#include "x2_inc_globals"
#include "nw_i0_plot"

void main()
{
 SetLocalInt(GetModule(),"Aghaaz",99);
 object oItem = GetItemPossessedBy(GetPCSpeaker(), "q4c_ferron_head");
 ActionTakeItem(oItem, GetPCSpeaker());
 RemoveJournalQuestEntry("q4_Ferron",GetPCSpeaker());
 SetPlot("q4_aghaaz", 99);
 SetGlobalInt("x2_plot_golem2_in", 1);
 Reward_2daXP(GetPCSpeaker(), 33);
}

