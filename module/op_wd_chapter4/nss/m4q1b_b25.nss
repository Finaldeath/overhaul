////////////////////////////////////////////////////////////
// OnClick/OnAreaTransitionClick
// M4Q1B_B25
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
// Created By: Cori May
// Created On: April 2002
// Description: The user goes to Maugrim's Sanctuary.
////////////////////////////////////////////////////////////

void main()
{
  object oPC = GetLastUsedBy();
  object oTarget = GetObjectByTag("WP_M4Q1B25_IN");

  AssignCommand(oPC,JumpToObject(oTarget));
}
