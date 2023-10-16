//::///////////////////////////////////////////////
//:: Name: q2a1_con_jumppc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When one person decides to enter the council chambers
    for the Council Chamber cutscene - all members of the
    party should be asked if they wish to join the meeting
    (be transported to the council chambers).
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 13/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    location lTarget = GetLocation(GetWaypointByTag("wp_q2a4_start"));
    AssignCommand(oPC, ActionJumpToLocation(lTarget));
}
