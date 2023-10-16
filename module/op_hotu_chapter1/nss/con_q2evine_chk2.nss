//::///////////////////////////////////////////////
//:: FileName con_q2evine_chk1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/16/2003 10:33:44 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q2ebranch")) == FALSE)
        return FALSE;

    return TRUE;
}
