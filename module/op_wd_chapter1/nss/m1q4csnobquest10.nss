int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M1Q4NobleQuest") == 10 &&
                GetLocalObject(OBJECT_SELF,"NW_L_M1Q4NobleQuestPC") == GetPCSpeaker();
	return l_iResult;
}
