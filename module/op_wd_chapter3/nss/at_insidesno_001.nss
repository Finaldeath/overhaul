//::///////////////////////////////////////////////
//:: AT_INSIDESNO_001.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the player out of snowglobe.

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


#include "M3PLOTINCLUDE"

void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    object oPC = GetClickingObject();
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);

  object oOldArea = GetArea(oPC);
  object oTarget = GetObjectByTag("M3Q1A11BBackFromGlobe");
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_FOREST);
  CheckGlobeInUse(oOldArea);
  DelayCommand(1.5,AssignCommand(oPC,JumpToLocation(lLoc)));
}
