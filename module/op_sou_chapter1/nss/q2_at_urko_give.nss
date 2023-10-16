//::///////////////////////////////////////////////
//:: FileName q2_at_urko_give
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/4/2003 1:05:44 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    //CreateItemOnObject("mummifiedhand", GetPCSpeaker(), 1);
    object oHand = GetItemPossessedBy(OBJECT_SELF, "mummifiedhand");
    ActionGiveItem(oHand, GetPCSpeaker());

    SetLocalInt(OBJECT_SELF, "nKoboldsReadyToFlee", 1);
}
