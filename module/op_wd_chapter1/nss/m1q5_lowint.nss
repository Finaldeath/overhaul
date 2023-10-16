int StartingConditional()
{
	int l_iResult;
    int nIntelligence = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE);
	l_iResult = nIntelligence <= 8;
	return l_iResult;
}
