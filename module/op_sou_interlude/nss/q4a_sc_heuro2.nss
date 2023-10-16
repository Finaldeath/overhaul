// dorna is present

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
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetPCSpeaker());
    if(GetTag(oHenchman) == "x0_hen_dor")
    {
        float fDistance = GetDistanceBetween(oHenchman, OBJECT_SELF);
        if(fDistance <= 15.0)
        {
            RemoveEffects(oHenchman);
            return TRUE;
        }
    }
    return FALSE;
}
