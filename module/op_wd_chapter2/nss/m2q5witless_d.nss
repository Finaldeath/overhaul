//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q5WITLESS_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Witless fighter moves up to Zamithra's room.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 12, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oDoor = GetObjectByTag("M2Q5N_M2Q5O");
    object oDoor2 = GetObjectByTag("M2Q5DZAMITHDOOR");
    object oWaypoint = GetWaypointByTag("WP_WITLESS");
    object oWaypoint1 = GetWaypointByTag("WP_ZAMITH");
    object oWaypoint2 = GetWaypointByTag("WP_ZAMITH3");
    object oWaypoint3 = GetWaypointByTag("WP_ZAMITH4");

    switch (nEvent)
    {
        case 500:
            SetLocalInt(OBJECT_SELF,"NW_L_Moving",10);
            if (GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 0)
            {
                ClearAllActions();
                //ActionMoveToObject(oWaypoint);
                ActionForceMoveToObject(oDoor,FALSE,1.9,10.0);
                //ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(OBJECT_SELF)));
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",10));
                ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(500)));
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 10)
            {
                ClearAllActions();
                ActionJumpToObject(oWaypoint1);
                ActionForceMoveToObject(oWaypoint2,FALSE,1.0,10.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",20));
                ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(500)));
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 20)
            {
                ClearAllActions();
                ActionCloseDoor(oDoor2);
                ActionForceMoveToObject(oWaypoint3,FALSE,1.0,10.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",30));
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moving",0));
                ActionWait(1.0);
                ActionDoCommand(SetFacing(GetFacing(oWaypoint3)));
            }
        break;
    }
}
