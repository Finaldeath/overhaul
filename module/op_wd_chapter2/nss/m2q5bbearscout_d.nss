//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q5BBearScout_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script controls the creature running for
    reinforcements.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            if (GetDistanceToObject(GetWaypointByTag("WP_M2Q5HUT01")) > 2.0)
            {
                ActionMoveToObject(GetWaypointByTag("WP_M2Q5HUT01"),TRUE);
                ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(500)));
            }
            else
            {
                ActionDoCommand(SpeakString("NW_ATTACK_MY_TARGET",TALKVOLUME_SILENT_SHOUT));
                ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(501)));
            }
        break;
        case 501:
            if (GetDistanceToObject(GetWaypointByTag("WP_M2Q5HUT02")) > 2.0)
            {
                ActionMoveToObject(GetWaypointByTag("WP_M2Q5HUT02"),TRUE);
                ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(501)));
            }
            else
            {
                ActionDoCommand(SpeakString("NW_ATTACK_MY_TARGET",TALKVOLUME_SILENT_SHOUT));
                SetLocalInt(OBJECT_SELF,"NW_L_BeastsFree",10);
                ActionMoveToObject(GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack"));
            }
        break;
    }
}
