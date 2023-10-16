int StartingConditional()
{
	int bCondition = GetAbilityScore(GetPCSpeaker(),ABILITY_DEXTERITY) < 14 &&
                     GetAbilityScore(GetPCSpeaker(),ABILITY_CONSTITUTION) >= 14;
	return bCondition;
}
