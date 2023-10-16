//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT6
//:: Default OnDamaged handler
/*
    If already fighting then ignore, else determine
    combat round
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    object oDamager = GetLastDamager();
    effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST);
    effect eVis  = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    int nDam = d6(2);

    nDam = GetReflexAdjustedDamage(nDam, oDamager, 15, SAVING_THROW_TYPE_ELECTRICITY);
    effect eDam = EffectDamage(nDam, DAMAGE_TYPE_ELECTRICAL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oDamager);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDamager);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oDamager, 1.0);
    // Send the user-defined event signal
    if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DAMAGED));
    }
}
