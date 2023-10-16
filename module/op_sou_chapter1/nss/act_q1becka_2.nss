//::///////////////////////////////////////////////
//:: Name act_q1becka_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC is trapped in Rumgut's cave..
    A rat appears in the corner of the room,
    near a pile of stones and gives a couple of sqeaks.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object wpPC = GetWaypointByTag("wp_q1rumsecretent");
    CreateObject(OBJECT_TYPE_CREATURE, "q1rumgutrat", GetLocation(wpPC));
    SetLocalInt(OBJECT_SELF,"X1_BECKACAGE",20);
}
