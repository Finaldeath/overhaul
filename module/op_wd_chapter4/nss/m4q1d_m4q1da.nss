//* Enters the sourcestone
////////////////////////////////////////////////////////////
// OnClick/OnAreaTransitionClick
// M4Q1D_M4Q1DA
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
// Created By: Cori May
// Created On: April 2002
// Description: The user goes to the Source Stone Inner Sanctum.
////////////////////////////////////////////////////////////

void main()
{
  object oPC = GetLastUsedBy();
  object oTarget = GetObjectByTag("M4DragonLairEnter");
effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);
  AssignCommand(oPC,JumpToObject(oTarget));
}
