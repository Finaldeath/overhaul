//:://////////////////////////////////////////////
//:: Gust of Wind
//:: op_s_gustofwind
//:://////////////////////////////////////////////
/*
    This spell creates a blast of air at the target location. Any creature that
    fails their saving throw is knocked down for 3 rounds, and any unlocked door
    is closed (if open) or opened (if closed). It is also powerful enough to
    disperse any cloudlike area of effect spells (such as cloudkill) that are in
    the path of the wind gust.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = GetEffectLink(EFFECT_TYPE_KNOCKDOWN);
    float fDuration = RoundsToSeconds(3);

    ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_20, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_AREA_OF_EFFECT);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            // Gust of wind should only destroy "cloud/fog like" area of effect spells.
            string sAOETag = GetTag(oTarget);
            if ( sAOETag == "VFX_PER_FOGACID" ||
                 sAOETag == "VFX_PER_FOGKILL" ||
                 sAOETag == "VFX_PER_FOGBEWILDERMENT" ||
                 sAOETag == "VFX_PER_FOGSTINK" ||
                 sAOETag == "VFX_PER_FOGFIRE" ||
                 sAOETag == "VFX_PER_FOGMIND" ||
                 sAOETag == "VFX_PER_CREEPING_DOOM" ||
                 sAOETag == "VFX_PER_MIASMICCLOUD")
            {
                DelayCommand(fDelay, ApplyVisualEffectAtLocation(VFX_IMP_PULSE_WIND, GetLocation(oTarget)));
                DestroyObject(oTarget);
            }
        }
        else if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
        {
            SignalSpellCastAt();

            if (!GetLocked(oTarget))
            {
                DelayCommand(fDelay, ApplyVisualEffectAtLocation(VFX_IMP_PULSE_WIND, GetLocation(oTarget)));
                if (GetIsOpen(oTarget))
                {
                    ExecuteScriptChunk("PlayAnimation(ANIMATION_DOOR_CLOSE)", oTarget);
                }
                else
                {
                    // TODO would be to make sure this direction makes sense, ie "away" from the blast
                    ExecuteScriptChunk("PlayAnimation(ANIMATION_DOOR_OPEN1)", oTarget);
                }
            }
        }
        else
        {
            SignalSpellCastAt();

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_KNOCKDOWN))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_PULSE_WIND, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                    }
                }
            }
        }
    }
}

