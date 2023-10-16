//::///////////////////////////////////////////////
//:: q4c_ferron99x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Sets Ferron global to 99 (given Ferron the power source)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"
#include "x2_inc_globals"

void main()
{
 SetLocalInt(GetModule(),"Ferron",99);
 object oItem = GetItemPossessedBy(GetPCSpeaker(), "q4_power_source");
 ActionTakeItem(oItem, GetPCSpeaker());
 RemoveJournalQuestEntry("q4_Aghaaz",GetPCSpeaker());
 SetPlot("q4_ferron", 99);
 SetGlobalInt("x2_plot_golem1_in", 1);
 Reward_2daXP(GetPCSpeaker(), 32);
}
