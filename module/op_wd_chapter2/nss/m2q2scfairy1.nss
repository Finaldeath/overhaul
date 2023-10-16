//* Make sure that the Druid Challenger has been defeated
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q2_DRUIDARENA4") == 10 ||
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA3") == 10 ||
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA2") == 10 ||
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA1") == 10 ||
                GetLocalInt(GetModule(),"M2Q2_DRUIDARENA") == 10 ;
	return l_iResult;
}
