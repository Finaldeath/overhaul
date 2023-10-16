#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    effect eWeb = EffectEntangle();
    effect eVis = EffectVisualEffect(VFX_DUR_WEB);
    effect eLink = EffectLinkEffects(eWeb,eVis);
    object oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget))
        {
            //Make a Fortitude Save to avoid the effects of the entangle.
            if(!/*Reflex Save*/ MySavingThrow(SAVING_THROW_REFLEX, oTarget, 15))
            {
                //Entangle effect and Web VFX impact
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1));
            }
         }
         oTarget = GetNextInPersistentObject();
    }
}


