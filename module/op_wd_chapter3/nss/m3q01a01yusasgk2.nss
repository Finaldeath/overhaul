////Checks that Uthgardt Plot is not over


int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTUTHGARDTELKTRIBE") != 99;
	return l_iResult;
}
