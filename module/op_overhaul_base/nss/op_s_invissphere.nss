//:://////////////////////////////////////////////
//:: Invisibility Sphere
//:: op_s_invissphere
//:://////////////////////////////////////////////
/*
    The caster brings into being a zone of invisibility that travels with him
    for the duration of the spell. All allies within the spell's area of effect
    are rendered invisible. Those that leave the sphere are visible once more
    and returning to the area doesn't make them invisible again.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            // Don't do it twice
            if (!GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)))
            {
                SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), TRUE);

                effect eLink     = EffectLinkEffects(EffectInvisibility(INVISIBILITY_TYPE_NORMAL),
                                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
                ApplyAOEPersistentEffect(oTarget, eLink);
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_PER_INVIS_SPHERE, GetScriptName(), GetScriptName(), GetScriptName()),
                       EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, MINUTES));
    }
}

