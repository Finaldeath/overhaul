//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Attack #2 (Action Script)
//:: H2_Gruul_Attak2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump Gru'ul over his table and turn him
     hostile. Add the artifact for him to drop.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    //Spawn the artifact on him.
    CreateItemOnObject("h2_gruul_artifac", OBJECT_SELF);

    //Make him jump over the table to the designated waypoint.
    object oJumpTo = GetObjectByTag("WP_Gruul_JumpTo");
    location lJumpTo = GetLocation(oJumpTo);
    effect eJump = EffectDisappearAppear(lJumpTo);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 3.0);

    //Turn off his plot flag
    SetPlotFlag(OBJECT_SELF, FALSE);

    //Turn him hostile.
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    DetermineCombatRound();
}

