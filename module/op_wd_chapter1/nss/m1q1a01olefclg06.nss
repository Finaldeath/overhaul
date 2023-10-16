int StartingConditional()
{
	int bCondition =  GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven") != GetPCSpeaker();
	return bCondition;
}
