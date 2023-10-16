//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q2_ud_feran
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran's user defined script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
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
        object oWay = GetObjectByTag("q2ca_feran_office");
        location lWay = GetLocation(oWay);
        object oPC = GetFirstPC();
        CreateObject(OBJECT_TYPE_CREATURE,"q2_mgreplace",lWay);
        SetLocalInt(oPC,"OS_FERAN_DEAD",10);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

