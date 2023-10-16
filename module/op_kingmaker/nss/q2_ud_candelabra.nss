//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q2_ud_candelabra
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User events for Candelabra
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
        object oPC = GetLocalObject(OBJECT_SELF,"OS_PC_CANDELABRA");
//        object oPC = GetFirstPC();
        if(GetLocalInt(OBJECT_SELF,"OS_CANDELABRA")==10)
        {
            ClearAllActions();
            ActionForceMoveToObject(oPC,FALSE,4.0);
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

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    if(nUser == 306) // Player enters
    {
        SetLocalInt(OBJECT_SELF,"OS_CANDELABRA",10);
    }
    else if(nUser == 307) // player leaves
    {
        SetLocalInt(OBJECT_SELF,"OS_CANDELABRA",0);
        ClearAllActions();
    }
}

