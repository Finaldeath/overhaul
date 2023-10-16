//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 3 Condition
//:: WW1_Hag_Tour3_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is currently at
     the Filcher's Maze tour node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sTourNode = GetLocalString(OBJECT_SELF, "TourNode");
    int bTour3Complete = GetLocalInt(oPC, "bTour3Complete");

    if (sTourNode == "Filcher's Maze" &&
        bTour3Complete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
