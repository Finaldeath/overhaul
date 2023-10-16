int StartingConditional()
{
	int l_iResult;

	l_iResult =GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) >= 15 &&
               GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1;
	return l_iResult;
}
