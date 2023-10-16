//::///////////////////////////////////////////////
//:: Name: q2dc_ud_ballista
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ballista has been targetted for destruction
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 23/03
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 199)
    {
        object oWiz = GetObjectByTag("x2_q2drowwiz3");
        if (GetIsObjectValid(oWiz) == TRUE)
        {
            float fDistance = GetDistanceToObject(oWiz);
            float fDelay = fDistance/9.0;
            effect eDamage = EffectDamage(56);
            effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
            effect eLink = EffectLinkEffects(eDamage, eVis);
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, OBJECT_SELF));
        }
    }
}
