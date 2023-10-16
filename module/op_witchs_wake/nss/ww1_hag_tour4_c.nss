//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 4 Condition
//:: WW1_Hag_Tour4_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is currently at
     the Returning Home tour node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sTourNode = GetLocalString(OBJECT_SELF, "TourNode");

    if (sTourNode == "Returning Home")
    {
        return TRUE;
    }
    return FALSE;
}
