//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 3
//:: WW1_HagTour3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger's the Night Hag's conversation for
     the Filcher's Maze
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bTour3Complete = GetLocalInt(oPC, "bTour3Complete");

    if (GetIsPC(oPC) == TRUE &&
        bTour3Complete == FALSE)
    {
        object oNightHagInvis = GetNearestObjectByTag("NightHagInvis");

        SetLocalString(oNightHagInvis, "TourNode", "Filcher's Maze");
        AssignCommand(oNightHagInvis, ActionStartConversation(oPC));
    }
}
