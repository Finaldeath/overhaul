//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 1 Condition
//:: WW1_Hag_Tour1_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is currently at
     the Isle of the Dead tour node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sTourNode = GetLocalString(OBJECT_SELF, "TourNode");
    int bTour1Complete = GetLocalInt(oPC, "bTour1Complete");

    if (sTourNode == "Isle of the Dead" &&
        bTour1Complete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
