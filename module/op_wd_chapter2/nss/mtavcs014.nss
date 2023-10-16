int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE002")) &&
                GetLocalInt(GetModule(),"NW_G_ARENALEVEL3") == 0;
	return l_iResult;
}
