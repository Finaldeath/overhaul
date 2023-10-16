int StartingConditional()
{
	int l_iResult;

	l_iResult = GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) == "NW_CLOTH029";
	return l_iResult;
}
