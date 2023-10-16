int StartingConditional()
{
	int l_iResult;
    int nCharisma = GetAbilityScore(GetLastSpeaker(),ABILITY_CHARISMA);
	l_iResult = nCharisma >= 15 &&
               GetLocalInt(OBJECT_SELF,"L_TALKTIMES") < 1;
	return l_iResult;
}
