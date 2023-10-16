//::///////////////////////////////////////////////
//:: FileName temp3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/3/2003 6:56:20 PM
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    AddJournalQuestEntry("q6_temple",99,GetPCSpeaker());

    // Give the speaker the items
    object oShard = GetItemPossessedBy(OBJECT_SELF, "q6_shard");
    object oCure = GetItemPossessedBy(OBJECT_SELF, "q6e_cure");

    ActionGiveItem(oCure, GetPCSpeaker());
    ActionGiveItem(oShard, GetPCSpeaker());
    Reward_2daXP(GetPCSpeaker(), 42);
    SetLocalInt(OBJECT_SELF, "STATUS", 5);

}
