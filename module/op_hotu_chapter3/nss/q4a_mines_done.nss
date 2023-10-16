//::///////////////////////////////////////////////
//:: FileName q4a_mines_done
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/9/2003 11:18:01 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(1, GetPCSpeaker());


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "q4a_bucket_m");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    // Set the variables
    SetLocalInt(OBJECT_SELF, "mines_done", GetLocalInt(OBJECT_SELF, "mines_done") + 1);

}
