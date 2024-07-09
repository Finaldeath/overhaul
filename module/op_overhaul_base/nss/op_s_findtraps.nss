//::///////////////////////////////////////////////
//:: Find Traps
//:: op_s_findtraps.nss
//:://////////////////////////////////////////////
/*
    All traps within the area of effect become known to the casters party.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void SetDetectedByParty(object oTrap, object oCaster);

void main()
{
    if (DoSpellHook()) return;

    ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_30, lTarget); // TODO replace with better VFX

    // Find the traps or trapped objects
    json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_DISTANCE, OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR | OBJECT_TYPE_TRIGGER);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        if (GetIsTrapped(oTarget) && GetTrapDetectDC(oTarget) < 35)
        {
            float fDelay = GetDistanceBetween(oTarget, oCaster)/20.0;

            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_KNOCK, oTarget));// TODO replace with a better VFX
            DelayCommand(fDelay + 1.0, SetDetectedByParty(oTarget, oCaster));
        }
    }
}

void SetDetectedByParty(object oTrap, object oCaster)
{
    // PC or NPC with PC master means all party can be done
    if (GetIsPC(oCaster) || GetIsPC(GetMaster(oCaster)))
    {
        object oMember = GetFirstFactionMember(oCaster);
        while (GetIsObjectValid(oMember))
        {
            SetTrapDetectedBy(oTrap, oMember, TRUE);
            oMember = GetNextFactionMember(oCaster);
        }
    }
    else
    {
        // Just friends in the area
        int nNth = 1;
        object oMember = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oCaster, nNth);
        while (GetIsObjectValid(oMember))
        {
            SetTrapDetectedBy(oTrap, oMember, TRUE);
            oMember = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oCaster, ++nNth);
        }
    }
}
