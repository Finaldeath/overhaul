//::///////////////////////////////////////////////
//:: Check Portal In Use
//:: 2Q6_PortalLock
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes sure that two portals are never opened
    at the same time on the same level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////


#include "NW_I0_HOSTINCL"
int StartingConditional()
{
    int nEnd = GetHostTowerLevel();
    string sEnd;
    string sTrigger;
    string sStart;
    if(nEnd == 10)
    {
        sEnd = "2Q6_PORTAL_B_10";
    }
    else
    {
        sEnd = "2Q6_PORTAL_B_0" + IntToString(nEnd);
    }
    int nStart = GetHostTowerLevel();
    if(nStart == 10)
    {
        sTrigger = "2Q6_Portal_10";
        sStart = "2Q6_START_10";
    }
    else
    {
        sTrigger = "2Q6_Portal_0" + IntToString(nStart);
        sStart =  "2Q6_START_0" + IntToString(nStart);
    }
    object oTrigger = GetObjectByTag(sTrigger);
    object oDest = GetLocalObject(oTrigger, "NW_2Q6_PORTAL_DESTINATION");
    if(GetIsObjectValid(oDest))
    {
        return TRUE;
    }
    return FALSE;
}
