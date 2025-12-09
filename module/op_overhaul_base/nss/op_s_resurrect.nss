//:://////////////////////////////////////////////
//:: Resurrection Spells
//:: op_s_resurrect
//:://////////////////////////////////////////////
/*
    Raise Dead
    Returns one target corpse to life. The raised character returns to life with
    only 1 Hit Point.

    Resurrection
    Returns a single target corpse to life with full Hit Points.

    NB: May need to add in some other cleanups of effects for resurrection.

    Copied over some Bioware code regarding using it on placeables.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nVis = VFX_INVALID;
    int nHeal = 0;

    switch (nSpellId)
    {
        case SPELL_RAISE_DEAD:
        {
            nVis = VFX_IMP_RAISE_DEAD;
        }
        break;
        case SPELL_RESURRECTION:
        {
            nVis = VFX_IMP_RAISE_DEAD;
            nHeal = GetMaxHitPoints(oTarget) + 10;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    SignalSpellCastAt();

    if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        if (GetIsDead(oTarget))
        {
            ApplyVisualEffectAtObjectsLocation(nVis, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oTarget);
            if (nHeal > 0) ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oTarget);
        }
    }
    else
    {
        // Bioware code
        int nStrRef = GetLocalInt(oTarget,"X2_L_RESURRECT_SPELL_MSG_RESREF");
        if (nStrRef == 0)
        {
            nStrRef = STRREF_THIS_OBJECT_CAN_NOT_BE_BROUGHT_BACK_FROM_THE_DEAD; // This object can not be brought back from the dead!
        }
        if (nStrRef != -1)
        {
             FloatingTextStrRefOnCreature(nStrRef, oCaster);
        }
    }
}

