int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_SeedyTavern") == 0 &&
                GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) != "NW_CLOTH029" &&
                GetLocalInt(OBJECT_SELF,"NW_L_TriedBribe") == 10;
	return l_iResult;
}
