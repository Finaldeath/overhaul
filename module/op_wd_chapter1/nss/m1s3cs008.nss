int StartingConditional()
{
	int l_iResult;

	l_iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_AARCL013")) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S03ICTBADGE01")) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S03ICTBADGE02"));
	return l_iResult;
}

