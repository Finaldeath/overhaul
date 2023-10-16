int StartingConditional()
{
    int nClass = GetClassByPosition(1,GetPCSpeaker());
	int bCondition = nClass == CLASS_TYPE_MONK ||
                     nClass == CLASS_TYPE_CLERIC ||
                     nClass == CLASS_TYPE_PALADIN;
	return bCondition;
}
