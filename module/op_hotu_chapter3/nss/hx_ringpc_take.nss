//::///////////////////////////////////////////////
//:: FileName hx_ringpc_take
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/25/2003 4:59:47 PM
//:://////////////////////////////////////////////
void main()
{
	// Give the speaker the items
	CreateItemOnObject("hx_puzzle_ring", GetPCSpeaker(), 1);


	// Remove items from the player's inventory
	object oItemToTake;
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "hx_ringpiece_1");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "hx_ringpiece_2");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "hx_ringpiece_3");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
}
