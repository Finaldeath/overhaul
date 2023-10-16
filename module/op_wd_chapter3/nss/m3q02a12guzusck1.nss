int StartingConditional()
{
    int l_iResult;

    l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 8 &&
                GetLocalInt(OBJECT_SELF,"NW_L_M3Q02TALKGUZUDHEAD") == 0
                && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q1A07WRIT"));
    return l_iResult;
}
