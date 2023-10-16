//::///////////////////////////////////////////////
//::
//:: OnHeartBeat
//::
//:: NW_TAV_Barmaid1.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script makes the barmaid wander randomly
//:: to the tavern waypoints taking drink orders.
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
    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        //  This is the random wander section.
        //  Get a random waypoint number.
        int nRandomNum = Random(GetLocalInt(GetArea(OBJECT_SELF),"NW_L_NumWaypoints")) + 1;

        if (GetDistanceToObject(GetWaypointByTag("TavernWay" + IntToString(nRandomNum))) > 3.0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_BarmaidTalk") == 0 &&
            !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
        {
            ClearAllActions();
            ActionMoveToObject(GetWaypointByTag("TavernWay" + IntToString(nRandomNum)));
        }

        //  If the barmaid's drink local has not been reset properly and there are no
        //  waiting customers, reset the local.
        if (GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") > 0 &&
            !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")) &&
            !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer2")))
        {
            SetLocalInt(OBJECT_SELF,"NW_L_HaveDrink",0);
        }

        //  If there is a waiting customer, go get the drink from the bar.
        if (GetDistanceToObject(GetWaypointByTag("BarkeepWay")) > 3.0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 0 &&
            GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
        {
            ClearAllActions();
            ActionMoveToObject(GetWaypointByTag("BarkeepWay"));
        }

        //  Once at the bar, talk to the barkeep.
        if (GetDistanceToObject(GetWaypointByTag("BarkeepWay")) <= 3.0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 0 &&
            GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF,"NW_L_HaveDrink",10);
            ActionStartConversation(GetNearestObjectByTag("NWGENBarkeep"));
        }

        //  If the barmaid has the drink, move to the waiting customer.
        if (GetDistanceToObject(GetLocalObject(OBJECT_SELF,"NW_L_Customer")) > 3.0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 20 &&
            GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
        {
            if (GetArea(OBJECT_SELF) == GetArea(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
            {
                ClearAllActions();
                ActionMoveToObject(GetLocalObject(OBJECT_SELF,"NW_L_Customer"));
            }
            else
            {
                //  If there are two customers, put the second customer up on the queue and erase the first one.
                if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer2")))
                {
                    SetLocalObject(OBJECT_SELF,"NW_L_Customer",GetLocalObject(OBJECT_SELF,"NW_L_Customer2"));
                    SetLocalObject(OBJECT_SELF,"NW_L_Customer2",OBJECT_INVALID);
                }
                else
                {
                    SetLocalObject(OBJECT_SELF,"NW_L_Customer",OBJECT_INVALID);
                }
            }
        }

        //  Once at the waiting customer, give the drink.
        if (GetDistanceToObject(GetLocalObject(OBJECT_SELF,"NW_L_Customer")) <= 3.0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_HaveDrink") == 20 &&
            GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
        {
            if (GetIsPC(GetLocalObject(OBJECT_SELF,"NW_L_Customer")))
            {
                ClearAllActions();
                ActionStartConversation(GetLocalObject(OBJECT_SELF,"NW_L_Customer"));
            }
            else
            {
                //  The customer needs to control the conversation, because there may be many customers
                //  with different tag names using the the same conversation.
                ClearAllActions();
                AssignCommand(GetLocalObject(OBJECT_SELF,"NW_L_Customer"),ActionStartConversation(GetNearestObjectByTag("NWGENBarmaid")));
            }
        }
    }
}
