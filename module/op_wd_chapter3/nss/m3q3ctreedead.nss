//::///////////////////////////////////////////////
//:: M3Q3CTreeDead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Every time a tree is destroyed, a random
    dryad is slain.

*/
//:://////////////////////////////////////////////
//:: Created By:       Brent
//:: Created On:       January 2002
//:://////////////////////////////////////////////

void main()
{
    object oDryad = GetNearestObjectByTag("M3Q3C02_DRYAD_1");
    if (GetIsObjectValid(oDryad) == TRUE)
    {
        effect eDeath = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oDryad);
    }
}
