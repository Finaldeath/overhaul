//::///////////////////////////////////////////////
//:: Check Arcane
//:: NW_D2_Arcane
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC is a Wizard, Sorcerer or Bard
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    return GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker()) + GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker()) + GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
}

