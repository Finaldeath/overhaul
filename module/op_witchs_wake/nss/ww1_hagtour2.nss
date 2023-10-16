//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 2
//:: WW1_HagTour2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger's the Night Hag's conversation for
     the Tree of Life
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bTour2Complete = GetLocalInt(oPC, "bTour2Complete");

    if (GetIsPC(oPC) == TRUE &&
        bTour2Complete == FALSE)
    {
        object oNightHagInvis = GetNearestObjectByTag("NightHagInvis");

        SetLocalString(oNightHagInvis, "TourNode", "Tree of Life");
        AssignCommand(oNightHagInvis, ActionStartConversation(oPC));
    }
}
