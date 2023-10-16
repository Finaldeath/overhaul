int StartingConditional()
{
    int nClass = GetClassByPosition(1,GetPCSpeaker());
	int bCondition = nClass == CLASS_TYPE_SORCERER ||
                     nClass == CLASS_TYPE_WIZARD;
	return bCondition;
}
