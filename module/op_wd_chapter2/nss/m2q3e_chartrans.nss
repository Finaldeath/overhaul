//::///////////////////////////////////////////////
//:: m2q3K Charwood Transition Area Swap Script
//:: m2q3E_CharTrans
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks the "m2q3_Resolution" local
    on the module.

    If it's not set, or set to "Guardian", it
    sends the clicker to m2q3GA.

    If it's set to "Quint" or "Player", it sends
    the clicker to m2q3GB.

    If it's set to "Karlat", it sends the clicker
    to m2q3GG.

    It also sets the "CharwoodEntered" local.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////

void main()
{
    int iEntered = GetLocalInt(GetModule(),"NW_G_CharwoodEntered");
    string sResolution = GetLocalString(GetModule(), "m2q3_Resolution");
    object oClicker = GetClickingObject();
    object oTarget;

    if (sResolution == "" || sResolution == "Guardian")
    {
        oTarget = GetWaypointByTag("WP_m2q3K_m2q3GA");
    }

    if (sResolution == "Quint" || sResolution == "Player")
    {
        oTarget = GetWaypointByTag("WP_m2q3K_m2q3GB");
    }

    if (sResolution == "Karlat")
    {
        oTarget = GetWaypointByTag("WP_m2q3K_m2q3GG");
    }

    location lTarget = GetLocation(oTarget);
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    AssignCommand(oClicker, JumpToLocation(lTarget));

    if (iEntered == 0)
    {
        SetLocalInt(GetModule(),"NW_G_CharwoodEntered", 10);
    }
}
