int StartingConditional()
{
	int l_iResult;

	l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 3 &&
                !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer2")) &&
                GetLocalObject(OBJECT_SELF,"NW_L_Customer") != OBJECT_SELF;
	return l_iResult;
}
