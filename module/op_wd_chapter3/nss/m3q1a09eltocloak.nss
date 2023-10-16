
//::///////////////////////////////////////////////
//:: Check Arcane  +Cloak
//:: M3Q1A09ELTOCLOAK.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC is a Wizard, Sorcerer or Bard
    AND if they are a member of the Many Starred
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    return (GetLevelByClass(CLASS_TYPE_BARD) + GetLevelByClass(CLASS_TYPE_WIZARD) + GetLevelByClass(CLASS_TYPE_SORCERER)
           && HasItem(GetPCSpeaker(),"NW_AARCL013"));
}

