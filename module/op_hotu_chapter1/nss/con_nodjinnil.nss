//::///////////////////////////////////////////////
//:: FileName con_nodjinni
//:://////////////////////////////////////////////
//
//  Checks int & to see pc has no djinn bottle
//
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: 11/29/2002 8:24:11 AM
//:://////////////////////////////////////////////

#include "nw_i0_plot"
int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "allDemonBottle"))&&CheckIntelligenceLow())
        return TRUE;

    return FALSE;
}
