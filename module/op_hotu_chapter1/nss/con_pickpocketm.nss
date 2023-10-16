//::///////////////////////////////////////////////
//:: Pickpocket Check Medium
//:: con_pickpockete
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the character made a medium
    pickpocket check.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov. 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
int StartingConditional()
{
    if (GetHasSkill(SKILL_PICK_POCKET,GetPCSpeaker()))

    return AutoDC(DC_MEDIUM, SKILL_PICK_POCKET, GetPCSpeaker());
  return FALSE;

}
