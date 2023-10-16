//::///////////////////////////////////////////////
//::
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a wizard or sorcerer
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{

    {
         int nClass;
         nClass = GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker());
         nClass += GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
         return nClass;

    }
    return FALSE;
}
