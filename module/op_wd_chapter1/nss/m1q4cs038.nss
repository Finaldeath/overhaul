int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) == TRUE ||
                GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,GetPCSpeaker())) == TRUE ||
                GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,GetPCSpeaker())) == TRUE;
	return l_iResult;
}
