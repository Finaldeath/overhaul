//::///////////////////////////////////////////////
//:: Time Stop
//:: op_s_timestop
//:://////////////////////////////////////////////
/*
    Time Stop applies by default 9 seconds of EffectTimeStop. Like the original
    spell we delay it slightly (for the VFX and to allow the 1.5 rounds to action
    properly)

    Optionally we could make this apply defensive spells as per SRD (which
    can be a better option in some cases).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    ApplyVisualEffectAtLocation(VFX_FNF_TIME_STOP, lTarget);

    SignalSpellCastAt();

    // Short delay as per original spell, for both the VFX to apply nicely
    // and the effect to work properly.
    DelayCommand(0.75, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, EffectTimeStop(), oTarget, 9.0));
}
