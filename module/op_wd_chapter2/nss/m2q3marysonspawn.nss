//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3MarySonSpawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn Maryweather's son.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    int iBoyReturned = GetLocalInt(OBJECT_SELF, "m2q3GA_BoyReturned");

    if (iBoyReturned == FALSE)
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q03CBOY",GetLocation(GetWaypointByTag("WP_M2Q3MARYSPAWN")));
        SetLocalInt(OBJECT_SELF, "m2q3GA_BoyReturned", TRUE);
    }
}
