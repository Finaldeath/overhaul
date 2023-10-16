//* Enters the sourcestone
////////////////////////////////////////////////////////////
// OnClick/OnAreaTransitionClick
// M4Q1D_PORTAL
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
// Created By: Cori May
// Created On: April 2002
// Description: The user goes back to the source stone entrance.
////////////////////////////////////////////////////////////

void main()
{
  object oPC = GetLastUsedBy();
  object oTarget = GetObjectByTag("WP_M4Q1C_SOURCE");

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);


  DelayCommand(3.0,AssignCommand(oPC,JumpToObject(oTarget)));
}
