int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1UrthCured") == 0 && GetLocalInt(GetModule(),"M2Q1UrthIsDead") == 0;
	return l_iResult;
}
