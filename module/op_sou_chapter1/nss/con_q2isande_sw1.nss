//::///////////////////////////////////////////////
//:: FileName con_q2isande_sw1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard & Dan Whiteside
//:: Created On: 2/4/2003 2:22:57 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "Q2_ANCIENT_SWORD"))
        return FALSE;

    if(!GetLocalInt(GetPCSpeaker(), "XP1_ISANDESWORD") ==10)
        return FALSE;

    return TRUE;
}
