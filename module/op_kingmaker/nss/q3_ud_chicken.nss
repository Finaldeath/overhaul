//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_chicken
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Chicken user defined event
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
                ActionDoCommand(DestroyObject(oGrain));
                SetLocalObject(oArea,"OS_GRAIN",OBJECT_INVALID);
            }
        }
    }
}

