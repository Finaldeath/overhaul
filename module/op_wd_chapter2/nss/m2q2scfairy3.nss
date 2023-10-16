int StartingConditional()
{
	int l_iResult;
    object oPC = GetPCSpeaker();

	l_iResult =  (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID")) == TRUE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA") == 20) ;
	return l_iResult;
}

