int StartingConditional()
{
	int l_iResult;

	l_iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q2ITRINGDRUID4")) &&
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA4") == 0;
	return l_iResult;
}
