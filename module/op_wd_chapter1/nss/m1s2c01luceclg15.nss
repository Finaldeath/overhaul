int StartingConditional()
{
    int nClass = GetClassByPosition(1,GetPCSpeaker());
	int bCondition = nClass == CLASS_TYPE_BARD ||
                     nClass == CLASS_TYPE_ROGUE;
	return bCondition;
}
