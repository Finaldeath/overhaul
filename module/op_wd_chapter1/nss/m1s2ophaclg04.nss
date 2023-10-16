int StartingConditional()
{
	int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Key1"));
	return bCondition;
}
