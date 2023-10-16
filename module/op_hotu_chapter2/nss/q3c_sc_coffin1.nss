//::///////////////////////////////////////////////
//:: FileName q3c_sc_coffin1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/11/2003 5:06:06 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "q3c_stake"))
        return FALSE;

    return TRUE;
}
