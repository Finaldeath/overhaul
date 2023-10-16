int StartingConditional()
{
	int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1A8Ward")) &&
                     (GetLevelByClass(CLASS_TYPE_FIGHTER,GetPCSpeaker()) > 0 ||
                     GetLevelByClass(CLASS_TYPE_BARBARIAN,GetPCSpeaker()) > 0 ||
                     GetLevelByClass(CLASS_TYPE_RANGER,GetPCSpeaker()) > 0  ||
                     GetLevelByClass(CLASS_TYPE_PALADIN,GetPCSpeaker()) > 0);
	return bCondition;
}
