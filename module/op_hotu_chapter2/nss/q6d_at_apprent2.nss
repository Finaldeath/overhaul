//::///////////////////////////////////////////////
//:: FileName q6d_at_apprent2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/2/2003 3:04:17 PM
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    // Give the speaker the items
    object oShard = GetItemPossessedBy(OBJECT_SELF, "q6_shard");
    DestroyObject(oShard);
    CreateItemOnObject("q6_shard", GetPCSpeaker(), 1);
    SetLocalInt(OBJECT_SELF, "GAVE_SHARD_TO_PC", 1);
    Reward_2daXP(GetPCSpeaker(), 42);
}
