//Include file to deal with poly morphed players.

void RemovePoly (object oCreature)
{
    effect ePolyMorph = GetFirstEffect(oCreature);

    while (GetIsEffectValid(ePolyMorph) == TRUE)
    {
        if (GetEffectType(ePolyMorph) == EFFECT_TYPE_POLYMORPH)
        {
            RemoveEffect(oCreature, ePolyMorph);
        }

        ePolyMorph = GetNextEffect(oCreature);
    }
}
