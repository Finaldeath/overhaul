//::///////////////////////////////////////////////
//:: FileName q3c_sc_bones1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/14/2003 5:11:00 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "q3c_blood"))
        return FALSE;
    SetLocalObject(OBJECT_SELF, "BLOOD", GetItemPossessedBy(GetPCSpeaker(), "q3c_blood"));
    return TRUE;
}
