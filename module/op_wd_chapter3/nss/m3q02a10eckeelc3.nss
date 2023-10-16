int StartingConditional()
{
int l_iResult;

l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 9 &&
            GetRacialType(OBJECT_SELF) == GetRacialType(GetPCSpeaker());
return l_iResult;
}
