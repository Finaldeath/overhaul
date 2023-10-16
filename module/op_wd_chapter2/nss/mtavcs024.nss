int StartingConditional()
{
	int l_iResult;

	l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 3 &&
                (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer2")) ||
                GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 20);
	return l_iResult;
}
