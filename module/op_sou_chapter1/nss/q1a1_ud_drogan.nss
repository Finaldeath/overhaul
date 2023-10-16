//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1a1_ud_drogan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make sure Drogan stays lying down if he's poisoned.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith WArner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetCurrentAction() == ACTION_INVALID && GetLocalInt(OBJECT_SELF, "X1_nCured") != 1)
        {
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK,1.0,14000.0);
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

