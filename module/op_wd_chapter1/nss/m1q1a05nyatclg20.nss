int StartingConditional()
{
	int bCondition = !(GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker()) > 0 ||
                     GetLevelByClass(CLASS_TYPE_RANGER,GetPCSpeaker()) > 0) &&
                     !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S3Fetish"));
	return bCondition;
}
