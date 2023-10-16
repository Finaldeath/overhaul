// other players with pc

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

int StartingConditional()
{
    object oPC = GetFirstPC();
    int nCount = 0;
    while(oPC != OBJECT_INVALID)
    {
        nCount++;
        oPC = GetNextPC();
    }
    return nCount == 1;
}
