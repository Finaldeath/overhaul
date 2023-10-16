int StartingConditional()
{
	int l_iResult;

	l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 4;
	return l_iResult;
}
