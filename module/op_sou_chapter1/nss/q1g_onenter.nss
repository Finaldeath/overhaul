//::///////////////////////////////////////////////
//:: Name q1g_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
There is a variable on the module called "q3_Blumberg_Refugees"
that gets set to 1 when the Blumberg refugees are released from
the gnoll caves and directed back to Hilltop.

When that variable is set,  four "Blumberg Refugee" creatures
will spawn into the Hall in Hilltop.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 13/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(GetModule(), "q3_Blumberg_Refugees") == 1 && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        location lSpawn1 = GetLocation(GetWaypointByTag("wp_q1g_blumref_1"));
        location lSpawn2 = GetLocation(GetWaypointByTag("wp_q1g_blumref_2"));
        location lSpawn3 = GetLocation(GetWaypointByTag("wp_q1g_blumref_3"));
        location lSpawn4 = GetLocation(GetWaypointByTag("wp_q1g_blumref_4"));

        CreateObject(OBJECT_TYPE_CREATURE, "q1gblumref1", lSpawn1);
        CreateObject(OBJECT_TYPE_CREATURE, "q1gblumref2", lSpawn2);
        CreateObject(OBJECT_TYPE_CREATURE, "q1gblumref3", lSpawn3);
        CreateObject(OBJECT_TYPE_CREATURE, "q1gblumref4", lSpawn4);
    }
}
