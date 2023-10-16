int StartingConditional()
{
	int l_iResult;

	l_iResult = GetAbilityScore(GetPCSpeaker(),ABILITY_CONSTITUTION) > 7;
	return l_iResult;
}
