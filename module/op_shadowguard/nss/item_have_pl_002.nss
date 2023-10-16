//::///////////////////////////////////////////////
//:: FileName item_have_pl_002
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/3/2003 3:13:36 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "IT_PLOT_M_1_002"))
        return FALSE;

    return TRUE;
}
