//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_koboldchie
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kobold Chief user defined events
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
        object oHermit = GetObjectByTag("q1_thehermit");
        SetLocalInt(oHermit,"OS_HONEY_THIEF",10);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

