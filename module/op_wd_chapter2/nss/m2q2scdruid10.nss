int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q2ITRINGDRUID3")) &&
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA2") == 0;
	return l_iResult;
}
