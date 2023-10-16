//::///////////////////////////////////////////////
//:: FileName xp1_checkupmark
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 12/4/2002 10:02:59 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(CheckPartyForItem(GetPCSpeaker(), "UppsalasMark"))
        return TRUE;

    return FALSE;
}
