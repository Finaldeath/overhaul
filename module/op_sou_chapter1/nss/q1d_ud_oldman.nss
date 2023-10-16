//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1d_ud_oldman
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Random Chatter from tavern patron...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 7/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //if (Random(3) + 1 == 3)
       // {
       //     SpeakString("Where's my pie!?");
       // }
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

