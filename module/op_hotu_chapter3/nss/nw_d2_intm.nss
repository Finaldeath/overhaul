// Intelligence is in the middle range (9-14)
// NOTE:Brent intentionally overriding this script in an emergency fix.
int StartingConditional()
{
    int iResult;
    int nIQ =   GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE);
    if (nIQ >=9 && nIQ <= 14)
    {
        return TRUE;
    }
    return FALSE;
}
