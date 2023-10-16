int StartingConditional()
{
    int nClass = GetClassByPosition(1,GetPCSpeaker());
	int bCondition = nClass == CLASS_TYPE_DRUID ||
                     nClass == CLASS_TYPE_RANGER;
	return bCondition;
}
