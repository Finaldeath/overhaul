//::///////////////////////////////////////////////
//:: FileName conv_hv_plot_003
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/12/2003 5:04:50 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "IT_PLOT_011"))
        return FALSE;

    return TRUE;
}
