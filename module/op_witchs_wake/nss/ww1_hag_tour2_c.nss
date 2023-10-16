//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 2 Condition
//:: WW1_Hag_Tour2_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is currently at
     the Tree of Life tour node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sTourNode = GetLocalString(OBJECT_SELF, "TourNode");
    int bTour2Complete = GetLocalInt(oPC, "bTour2Complete");

    if (sTourNode == "Tree of Life" &&
        bTour2Complete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
