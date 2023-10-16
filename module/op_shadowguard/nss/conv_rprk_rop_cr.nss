//::///////////////////////////////////////////////
//:: FileName conv_sc_tak_rope
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/18/2003 4:10:31 AM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();

    object oBoulder = GetLocalObject(oPC, "O_CURR_ROPE_OBJECT");

    SignalEvent(oBoulder, EventUserDefined(1001));

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "IT_MISC_THN_001");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
