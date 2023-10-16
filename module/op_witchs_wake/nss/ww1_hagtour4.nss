//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tour, Node 4
//:: WW1_HagTour4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger's the Night Hag's conversation for
     the Returning Home tour node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE)
    {
        object oNightHag = GetNearestObjectByTag("NightHagTour");

        SetLocalString(oNightHag, "TourNode", "Returning Home");
    }
}
