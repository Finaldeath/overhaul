//::///////////////////////////////////////////////
//:: m2q3H Main Door Area Swap Script
//:: m2q3H_MainDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks the "m2q3_Resolution" local
    on the module.

    If it's not set, it sends the clicker to
    m2q3GA.

    If it's set to "Guardian," it sends the
    clicker to the same place but destroys the
    returning area transition.

    If it's set to "Quint" or "Player", it sends
    the clicker to m2q3GB.

    If it's set to "Karlat", it sends the clicker
    to m2q3GG.

*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    string sResolution = GetLocalString(GetModule(), "m2q3_Resolution");
    object oClicker = GetClickingObject();
    object oTarget;

    if (sResolution == "Guardian")
    {
        object oTransition = GetObjectByTag("m2q3GA_m2q3H");
        DestroyObject(oTransition);

        oTarget = GetObjectByTag("m2q3GA_m2q3H");
    }
    else if (sResolution == "Quint" || sResolution == "Player")
    {
        oTarget = GetObjectByTag("WP_m2q3H_m2q3GB");
    }
    else if (sResolution == "Karlat")
    {
        oTarget = GetObjectByTag("WP_m2q3H_m2q3GG");
    }
    else// (sResolution == "")
    {
        oTarget = GetObjectByTag("m2q3GA_m2q3H");
    }

    location lTarget = GetLocation(oTarget);
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    AssignCommand(oClicker, JumpToLocation(lTarget));
}
