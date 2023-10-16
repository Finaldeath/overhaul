//::///////////////////////////////////////////////
//:: Shadow Portal Trigger (OnEnter)
//:: En_TrigShadPort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the Shadow Portal. Do a distance
     check to prevent the portal from spawning
     when the player is entering from the shadow
     plane.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT);
    float fDistance = GetDistanceBetween(oEnterer, oWP);

    if (GetIsPC(oEnterer) == TRUE && fDistance > 1.0)
    {
        SetLocalInt(OBJECT_SELF, "ShadowPortalActive", TRUE);
        SignalEvent(OBJECT_SELF, EventUserDefined(5008));
    }
}
