int StartingConditional()
{
    int nClass = GetClassByPosition(1,GetPCSpeaker());
	int bCondition = nClass == CLASS_TYPE_BARBARIAN ||
                     nClass == CLASS_TYPE_FIGHTER;
	return bCondition;
}
