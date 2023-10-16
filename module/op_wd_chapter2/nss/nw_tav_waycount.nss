//::///////////////////////////////////////////////
//::
//:: OnSpawnIn
//::
//:: NW_TAV_WayCount.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script counts the number of valid
//:: sequencial waypoints in the area.  All waypoints must
//:: be named "TavernWay" followed by a number (1 to n).
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: June 19, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    int nWay = 0;
    object oWay = GetFirstObjectInArea(OBJECT_SELF);

    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_L_NumWaypoints") == 0)
    {
        while(GetIsObjectValid(oWay))
        {
            if (GetObjectType(oWay) == OBJECT_TYPE_WAYPOINT && GetStringLeft(GetTag(oWay),9) == "TavernWay")
            {
                nWay++;
            }
            oWay = GetNextObjectInArea(OBJECT_SELF);
        }
        SetLocalInt(GetArea(OBJECT_SELF),"NW_L_NumWaypoints",nWay);
    }
}
