int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalObject(OBJECT_SELF, "NW_G_M3Q01TALKLILLIAN") == GetPCSpeaker();
	return l_iResult;
}
