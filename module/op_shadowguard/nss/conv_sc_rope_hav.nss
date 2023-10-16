//::///////////////////////////////////////////////
//:: FileName conv_sc_hav_rope
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/18/2003 4:10:04 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "IT_MISC_THN_001"))
        return FALSE;

    return TRUE;
}
