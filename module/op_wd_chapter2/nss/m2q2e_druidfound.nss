//::///////////////////////////////////////////////
//:: M2Q2E_DRUIDFOUND.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the druid objects in locations nearby if they have been found.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 19, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "NW_M2Q2E_LFINDDRUID1") == 1)
    {
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2IOrlane",GetLocation(GetWaypointByTag("WP_M2Q2E_ORLANE")));
    }
    if (GetLocalInt(GetModule(), "NW_M2Q2E_LFINDDRUID2") == 1)
    {
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2JBree",GetLocation(GetWaypointByTag("WP_M2Q2E_BREE")));
    }
    if (GetLocalInt(GetModule(), "NW_M2Q2E_LFINDDRUID3") == 1)
    {
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2HTerari",GetLocation(GetWaypointByTag("WP_M2Q2E_TERARI")));
    }
}
