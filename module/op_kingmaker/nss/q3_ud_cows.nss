//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_cows
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
        object oCow = GetObjectByTag("q3_cow");
        int nCow = GetLocalInt(oCow,"OS_FOLLOW");
        object oGord = GetObjectByTag("q2_thegord");
        object oWay = GetNearestObjectByTag("q3_map_exit");
        if(GetLocalInt(GetModule(), "OS_THEGORD_COWS")==30)
        {
            ActionForceMoveToObject(oWay,FALSE,1.0,15.0);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
        }
        else if(nCow==10)
        {
            ActionMoveToObject(oCow,FALSE,5.0);
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
}

