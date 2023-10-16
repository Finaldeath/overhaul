int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) == FALSE &&
                GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,GetPCSpeaker())) == FALSE &&
                GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,GetPCSpeaker())) == FALSE;
	return l_iResult;
}
