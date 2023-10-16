//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has dragon egg.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oEggs = GetItemPossessedBy(oPC,"q7cegg");
    // Make sure the PC speaker has these items in their inventory
    if(GetIsObjectValid(oEggs)== TRUE)
    {
         SetLocalObject(OBJECT_SELF,"DRAGONEGGS",oEggs);
         return TRUE;
    }


    return FALSE;
}
