//* Setara is still alive
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q2SetaraIsDead") == 0;
	return l_iResult;
}
