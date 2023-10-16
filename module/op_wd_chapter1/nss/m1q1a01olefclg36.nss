int StartingConditional()
{
    int bFound;
    object oPC = GetPCSpeaker();
    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect) && bFound == FALSE)
    {
        if(GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
        {
            bFound = TRUE;
        }
        eEffect = GetNextEffect(oPC);
    }
    return bFound;
}
