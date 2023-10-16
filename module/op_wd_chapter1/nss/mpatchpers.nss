//::///////////////////////////////////////////////
//:: mpatchpers
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Patch bug.
    Persuasion option should not appear if this character
    is the target of the intellect devourer.

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    object oPrisoner = GetLocalObject(GetObjectByTag("M1Q2_DEVOUR"),"NW_G_M1Q2DevTarget");
    if (oPrisoner == OBJECT_SELF)
    {
        return FALSE;
    }
    return AutoDC(DC_EASY, SKILL_PERSUADE, GetPCSpeaker());
}
