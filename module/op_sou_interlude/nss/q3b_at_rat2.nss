//::///////////////////////////////////////////////
//:: FileName q3b_at_rat2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/13/2003 5:32:54 PM
//:://////////////////////////////////////////////
void main()
{
    SetCommandable(TRUE, OBJECT_SELF);
    // Give the speaker the items
    object oItemToGive = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM005");
    ActionGiveItem(oItemToGive, GetPCSpeaker());

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC11");
    if(GetIsObjectValid(oItemToTake) != 0)
        ActionTakeItem(oItemToTake, GetPCSpeaker());
}
