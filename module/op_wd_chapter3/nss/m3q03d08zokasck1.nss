int StartingConditional()
{
int l_iResult;

l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 8 &&
            GetLocalInt(OBJECT_SELF, "NW_L_M3Q03TALKDAMAS") == 0;
return l_iResult;
}

