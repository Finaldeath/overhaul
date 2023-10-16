int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE003")) &&
                GetLocalInt(GetModule(),"NW_G_ARENALEVEL4") == 10;
	return l_iResult;
}
