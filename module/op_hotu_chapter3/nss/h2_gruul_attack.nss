//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Attack (Action Script)
//:: H2_Gruul_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump Gru'ul over his table and turn him
     hostile.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    //Make him jump over the table to the designated waypoint.
    object oJumpTo = GetObjectByTag("WP_Gruul_JumpTo");
    location lJumpTo = GetLocation(oJumpTo);
    effect eJump = EffectDisappearAppear(lJumpTo);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 2.0);

    //Turn off his plot flag
    SetPlotFlag(OBJECT_SELF, FALSE);

    //Turn him hostile.
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    DetermineCombatRound();

    //Make him face the player
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);
    DelayCommand(1.0, SetFacingPoint(vPC));
}
