//::///////////////////////////////////////////////
//::
//:: OnSpawnIn
//::
//:: NW_TAV_Barmaid9.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script counts the number of valid
//:: sequencial waypoints.  All waypoints must
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
    
    while(GetIsObjectValid(GetWaypointByTag("TavernWay" + IntToString(nWay + 1))))
    {
        nWay++;
    }
    SetLocalInt(OBJECT_SELF,"NW_L_NumWaypoints",nWay);
}
