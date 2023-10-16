//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_cow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cow user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oArea = GetArea(OBJECT_SELF);
        if(GetLocalInt(oArea,"OS_GRAIN")==10)
        {
            object oGrain = GetLocalObject(oArea,"OS_GRAIN");
            if(!GetIsObjectValid(oGrain))
            {
                ClearAllActions();
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        object oGord = GetObjectByTag("q2_thegord");
        if(GetLocalInt(GetModule(), "OS_THEGORD_COWS")<30)
        {
            SetLocalInt(GetModule(), "OS_THEGORD_COWS",35);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 303)
    {
        object oArea = GetArea(OBJECT_SELF);
        object oGrain = GetLocalObject(oArea,"OS_GRAIN");
        if(GetIsObjectValid(oGrain))
        {
            if(GetDistanceToObject(oGrain)<30.0)
            {
                ActionMoveToObject(oGrain);
                ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0,1.0);
/*                object oDoor = GetObjectByTag("q3aj_at_q1ab");
                if(GetDistanceToObject(oDoor)<5.0)
                {
                    object oWay = GetObjectByTag("q1_way_cow");
                    object oGord = GetObjectByTag("q2_thegord");
                    ActionJumpToObject(oWay);
                    SetLocalInt(OBJECT_SELF,"OS_FOLLOW",20);
                    if(GetLocalInt(GetModule(), "OS_THEGORD_COWS")<30)
                    {
                        SetLocalInt(GetModule(), "OS_THEGORD_COWS",30);
                    }
                }*/
                ActionDoCommand(DestroyObject(oGrain));
            }
        }
    }
}

