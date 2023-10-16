int StartingConditional()
{
	int bCondition = GetLevelByClass(CLASS_TYPE_SORCERER,GetPCSpeaker()) == 0 &&
                     GetLevelByClass(CLASS_TYPE_WIZARD,GetPCSpeaker()) == 0 &&
                     GetLevelByClass(CLASS_TYPE_BARD,GetPCSpeaker()) == 0 ;
	return bCondition;
}
