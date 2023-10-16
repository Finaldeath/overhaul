//x1_ice_phylac
// unique item power for ice phylactery: when used near the dragon: transform the player into a frost giant.
// When used away from the dragon: getting a message to use it later.
// After using it, the item is destroyed.
// The dragon's on-death or the dragon's area on-exit event transforms the player back into its natural form

#include "nw_i0_generic"

void main()
{
    object oPC = GetItemActivator();
    object oItem = GetItemActivated();

    object oDragon = GetNearestObjectByTag("NW_DRGWHITE001", oPC);
    float fDistance = GetDistanceBetween(oDragon, oPC);
    if(fDistance > 20.0 || fDistance == 0.0)
    {
        FloatingTextStrRefOnCreature(40420, oPC);
        return;
    }
    SetLocalObject(GetModule(), "X1_POLY_FROST_GIANT", oPC);
    SetLocalInt(oPC, "X1_nPolymorphGiant", 1);
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly;
    if (GetGender(oPC) == GENDER_MALE)
        ePoly = EffectPolymorph(44);   //New Polymorph specific for this cave only
    else
        ePoly = EffectPolymorph(45);   //New Polymorph specific for this cave only
    effect eLink = EffectLinkEffects(ePoly, eVis);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, oPC);


    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);

    ChangeToStandardFaction(oDragon, STANDARD_FACTION_HOSTILE);
    AssignCommand(oDragon, DetermineCombatRound(oPC));


    DestroyObject(oItem);
}
