//::///////////////////////////////////////////////
//:: Knock
//:: op_s_knock
//:://////////////////////////////////////////////
/*
    This spell will unlock doors and containers sealed by conventional locks.
    Exceptionally complex locking mechanisms or magically sealed doors and
    containers are beyond the abilities of this spell.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

#include "x2_inc_switches"

void main()
{
    if (DoSpellHook()) return;

    if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR ||
        GetObjectType(oTarget) == OBJECT_TYPE_PLACEABLE)
    {
        SignalSpellCastAt();

        if (GetLocked(oTarget))
        {
            if (!GetPlotFlag(oTarget))
            {
                // This is from XP2 - copied over for now.
                int nResist = GetDoorFlag(oTarget, DOOR_FLAG_RESIST_KNOCK);
                if (nResist == 0)
                {
                    ApplyVisualEffectToObject(VFX_IMP_KNOCK, oTarget);
                    SetLocked(oTarget, FALSE);
                }
                else if (nResist == 1)
                {
                    // NB: This just specifies Door, so have to do a second one for placeables
                    if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
                    {
                        FloatingTextStrRefOnCreature(STRREF_FAILURE_DOOR_UNAFFECTED_BY_MAGIC, oCaster, FALSE);   // * Failure! - Door unaffected by magic *
                    }
                    else
                    {
                        FloatingTextStringOnCreature("* Failure! - object unaffected by magic *", oCaster, FALSE);
                    }
                }
            }
            else
            {
                if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
                {
                    FloatingTextStrRefOnCreature(STRREF_FAILURE_DOOR_UNAFFECTED_BY_MAGIC, oCaster);   // * Failure! - Door unaffected by magic *
                }
                else
                {
                    FloatingTextStringOnCreature("* Failure! - object unaffected by magic *", oCaster, FALSE);
                }
            }
        }
        else
        {
            FloatingTextStringOnCreature("* Failure! - object not locked *", oCaster, FALSE);
        }
    }
}

