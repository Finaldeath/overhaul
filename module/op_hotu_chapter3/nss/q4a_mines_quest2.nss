//::///////////////////////////////////////////////
//:: FileName q4a_mines_quest2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/9/2003 11:19:44 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(1, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("nw_cloth027", GetPCSpeaker(), 1);

    // Set the ints
    SetLocalInt(OBJECT_SELF, "mines_done", GetLocalInt(OBJECT_SELF, "mines_done") + 1);
    SetLocalInt(OBJECT_SELF, "mine_boss_o", 1);

}
