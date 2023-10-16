int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker());
    int nStrength = GetAbilityScore(GetPCSpeaker(),ABILITY_STRENGTH);
    if (((nClass > 4) || (nStrength > 15)) && (!nStrength < 10))
    {
        return TRUE;
    }
    return FALSE;
}
