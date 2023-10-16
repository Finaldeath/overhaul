//::///////////////////////////////////////////////
//:: Name q2d4_ent_illspn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in some defences for the great hall
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    int nCount = 0;

    object oSpawn1 = GetWaypointByTag("wp_" + GetTag(OBJECT_SELF) + "a");
    if (GetIsObjectValid(oSpawn1) == TRUE)
        CreateObject(OBJECT_TYPE_CREATURE, "x2_mindflayer002", GetLocation(oSpawn1));

    object oSpawn2 = GetWaypointByTag("wp_" + GetTag(OBJECT_SELF) + "b");
    if (GetIsObjectValid(oSpawn2) == TRUE)
        CreateObject(OBJECT_TYPE_CREATURE, "x2_mindflayer001", GetLocation(oSpawn2));


    object oSpawn3 = GetWaypointByTag("wp_" + GetTag(OBJECT_SELF) + "c");
    if (GetIsObjectValid(oSpawn3) == TRUE)
        CreateObject(OBJECT_TYPE_CREATURE,"nw_umberhulk", GetLocation(oSpawn3));

    int nRandom;
    object oSpawn4;
    for (nCount = 0; nCount < 4; nCount++)
    {
        oSpawn4 = GetObjectByTag("wp_" + GetTag(OBJECT_SELF) + "d", nCount);
        if (GetIsObjectValid(oSpawn4) == TRUE)
        {
            object oThrall = CreateObject(OBJECT_TYPE_CREATURE,"q2dthrall" + IntToString(Random(3)+1), GetLocation(oSpawn4));
            ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
        }
        else
        {
            nCount = 4;
        }

    }

}
