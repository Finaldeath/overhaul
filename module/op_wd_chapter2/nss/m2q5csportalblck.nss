int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetNearestObjectByTag("M2Q05PPEDESTAL"),"M2Q05IPSTONE01")) == TRUE &&
                GetLocalInt(GetModule(),"NW_G_ElminsterBlocked") == 10;
	return l_iResult;
}
