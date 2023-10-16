//* Setara has been killed
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q2SetaraIsDead") == 1;
	return l_iResult;
}
