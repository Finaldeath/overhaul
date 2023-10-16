//:://////////////////////////////////////////////////
//:: X0_D2_HEN_LINE45
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Check to see if henchman should make this one-liner.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 09/16/2002
//:://////////////////////////////////////////////////


#include "x0_i0_henchman"

int StartingConditional()
{
    if(GetAlignmentGoodEvil(OBJECT_SELF) == ALIGNMENT_EVIL)
    {
        return (GetOneLiner() == 45);
    }
    return FALSE;
}
