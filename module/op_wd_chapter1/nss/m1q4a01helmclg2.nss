int StartingConditional()
{
	int bCondition = GetLevelByClass(CLASS_TYPE_CLERIC) > 0 ||
                      GetLevelByClass(CLASS_TYPE_PALADIN) > 0 ||
                       GetLevelByClass(CLASS_TYPE_MONK) > 0;
	return bCondition;
}
