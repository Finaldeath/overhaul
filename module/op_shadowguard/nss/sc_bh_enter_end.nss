//Handle the end of the sc_bh_enter cutscene.

#include "nw_i0_generic"

void main()
{
    //Cycle through the guards and turn them hostile.
    object oPC = GetPCSpeaker();
    int iNth = 1;
    object oGuard = GetNearestObjectByTag("BH_SLAVE_GUARD", oPC, iNth);
    while (oGuard != OBJECT_INVALID)
    {
        ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE);
        AssignCommand(oGuard, DetermineCombatRound(oPC));

        //Update the loop variables
        iNth++;
        oGuard = GetNearestObjectByTag("BH_SLAVE_GUARD", oPC, iNth);
    }

    //End the cutscene
    SetCutsceneMode(oPC, FALSE);

    //Apply a blindness effect to the player
    effect eBlind = EffectBlindness();
//    effect eBlindVFX = EffectVisualEffect(VFX_DUR_DARKNESS);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBlind, oPC);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBlindVFX, oPC);

    //Remove the Blackout
    FadeFromBlack(oPC);

}
