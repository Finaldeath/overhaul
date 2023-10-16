//::///////////////////////////////////////////////
//:: Name q2b_hb_floortp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If someone remains in the Ruin area for a heartbeat
    they will take additional damage
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:://////////////////////////////////////////////

void main()
{
    object oCreature = GetFirstInPersistentObject();
    while (oCreature != OBJECT_INVALID)
    {
        effect eDamage = EffectDamage(Random(20) + 1);
        effect vEffect = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oCreature);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, vEffect, oCreature, 6.0);
        oCreature = GetNextInPersistentObject();
    }
}
