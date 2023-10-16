int StartingConditional()
{
int l_iResult;

l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 9 &&
            GetLocalInt(GetModule(),"NW_G_M3Q01PLOTBOUNTYHUNTER") <1;
/////////// AND PLAYER DOES NOT HAVE VAATH'S HEAD IN POSSESION
return l_iResult;
}

