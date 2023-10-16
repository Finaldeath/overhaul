//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_bonemass
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fires the UD on the garg statue so that more
     skeletons are spawned in.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
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
        //object oGarg = GetObjectByTag("q4a_garg_skele4x");
        object oPed = GetObjectByTag("hx_ped1");

        //SignalEvent(oGarg, EventUserDefined(4444));
        SignalEvent(oPed, EventUserDefined(5555));
        SetLocalInt(GetArea(OBJECT_SELF), "SIGNAL_PENDING", 1);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

