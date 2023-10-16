int StartingConditional()
{
	int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Letter"));
	return bCondition;
}
