int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(GetModule(), "M3Q00OBRETFAMILY") == GetPCSpeaker();
	return l_iResult;
}
