#include "nw_i0_generic"

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    AssignCommand(oPC, ClearAllActions());
    object oDraco = GetObjectByTag("q3_vixthra");
    object oWPAppear = GetObjectByTag("q3d_wp_appear");
    effect eJump = EffectDisappearAppear(GetLocation(oWPAppear));
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, oDraco, 2.0);
    DelayCommand(1.0, AssignCommand(oDraco, DetermineCombatRound(oPC)));
    AdjustReputation(oPC, oDraco, -100);
    AdjustReputation(oDraco, oPC, -100);
}
