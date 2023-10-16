//::///////////////////////////////////////////////
//:: Leah being rescued
//:: M2Q5CSFARMPLOT07
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah being rescued
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    location lWaypoint1 = GetLocation(GetNearestObjectByTag("WP_BUGBEAR",OBJECT_SELF,1));
    location lWaypoint2 = GetLocation(GetNearestObjectByTag("WP_BUGBEAR",OBJECT_SELF,2));

    SetLocalInt(OBJECT_SELF,"NW_L_Rescued",10);
    RewardXP("m2q5_Gerrol",50, GetPCSpeaker());
    CreateObject(OBJECT_TYPE_CREATURE,"m2q05cbbearpa",lWaypoint1);
    CreateObject(OBJECT_TYPE_CREATURE,"m2q05cbbearpa",lWaypoint2);
    SignalEvent(OBJECT_SELF,EventUserDefined(500));
}

