//::///////////////////////////////////////////////
//:: FileName con_pchasdjinni
//:://////////////////////////////////////////////
//
//  Checks to see if PC has Djinn Bottle
//
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: 11/29/2002 8:24:11 AM
//:://////////////////////////////////////////////


int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "allDemonBottle")))
        return TRUE;

    return FALSE;
}
