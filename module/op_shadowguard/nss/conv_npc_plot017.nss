//::///////////////////////////////////////////////
//:: FileName conv_npc_plot017
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/12/2003 5:04:50 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
    // Make sure the NPC has this item in their inventory
    if(!HasItem(OBJECT_SELF, "IT_PLOT_017"))
        return FALSE;

    return TRUE;
}
