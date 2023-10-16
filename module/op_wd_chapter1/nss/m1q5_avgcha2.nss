int StartingConditional()
{
	int l_iResult;
    int nCharisma = GetAbilityScore(GetLastSpeaker(),ABILITY_CHARISMA);
	l_iResult =nCharisma >= 11 &&
                nCharisma <= 14 &&
                GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1;
	return l_iResult;
}

