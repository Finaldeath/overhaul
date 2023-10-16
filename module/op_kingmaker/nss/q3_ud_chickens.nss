//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_chickens
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
        object oChicken = GetObjectByTag("q3_chicken");
        if(GetLocalInt(oChicken,"OS_FOLLOW")==10)
        {
            ClearAllActions();
            ActionMoveToObject(oChicken);
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
}

