int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance") == 0 &&
                GetLocalInt(GetPCSpeaker(),"NW_L_TalkToDydd") == 0;
	return l_iResult;
}
