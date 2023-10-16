int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF, "NW_G_M3Q02PLOTBRETSRINGGIVEN") == 0 &&
                GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 9;
	return l_iResult;
}

