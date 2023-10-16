int StartingConditional()
{
int l_iResult;

l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 9 &&
            GetLocalInt(OBJECT_SELF, "NW_L_M3Q03TALKCURE") == 1 &&
            GetLocalInt(OBJECT_SELF, "NW_L_M3Q03TALKDAMAS") == 1;
return l_iResult;
}
