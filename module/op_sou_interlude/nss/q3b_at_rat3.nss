// dominated rat runs away


void RemoveEffects(object oObject)
{
    effect eEffect = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oObject, eEffect);
        eEffect = GetNextEffect(oObject);
    }
}

void main()
{
    SetCommandable(TRUE, OBJECT_SELF);
    object oWP = GetWaypointByTag("Q3B_WP_RAT_EXIT");
    RemoveEffects(OBJECT_SELF);
    DestroyObject(OBJECT_SELF);
}
