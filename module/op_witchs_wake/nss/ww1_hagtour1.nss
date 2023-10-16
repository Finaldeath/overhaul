//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 1
//:: WW1_HagTour1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger's the Night Hag's conversation for
     the Isle of the Dead
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bTour1Complete = GetLocalInt(oPC, "bTour1Complete");

    if (GetIsPC(oPC) == TRUE &&
        bTour1Complete == FALSE)
    {
        object oNightHagInvis = GetNearestObjectByTag("NightHagInvis");

        SetLocalString(oNightHagInvis, "TourNode", "Isle of the Dead");
        DelayCommand(1.0, AssignCommand(oNightHagInvis, ActionStartConversation(oPC)));
    }
}
