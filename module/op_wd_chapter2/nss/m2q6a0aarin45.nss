// if PC is female with at least a normal Intelligence and Charisma
// & Aarin is not romancing someone else

int StartingConditional()
{
    int iSex = GetGender(GetPCSpeaker());
    int iIntelligence = GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE);
    int iCharisma = GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA);
    object oRomance = GetLocalObject(OBJECT_SELF,"Chapter2_Aarin_Romance");
    if ((iSex == GENDER_FEMALE) && (iIntelligence > 8) && (iCharisma > 8) && (!GetIsObjectValid(oRomance)))
    {
        return TRUE;
    }
    return FALSE;
}
