//::///////////////////////////////////////////////
//:: FileName q2_at_isnd_rew
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/3/2003 12:47:05 PM
//:://////////////////////////////////////////////

#include "q2_inc_plot"

void main()
{
    // Give the speaker the items
    object oSword = GetItemPossessedBy(GetPCSpeaker(), "Q2_ANCIENT_SWORD");
    ActionTakeItem(oSword, GetPCSpeaker());
    //CreateItemOnObject("nw_it_mpotion005", GetPCSpeaker(), 1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2_isande_chest", GetLocation(GetPCSpeaker()));
    SetPlot("Q2_JOURNAL_LOST_SWORD", 100, GetPCSpeaker());
}
