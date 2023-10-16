//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3ai_ud_direrat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dire Rat custom user defined event
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
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
        object oPC = GetFirstPC();
        object oCave = GetArea(oPC);
        location lPC = GetLocation(oPC);
        int nDead = GetLocalInt(oCave,"Q3AI_KAI_RATS_DEAD")+1;
        SetLocalInt(oCave,"Q3AI_KAI_RATS_DEAD",nDead);
        if(nDead >=2)
        {
            object oWay = GetObjectByTag("q3ai_way_deadkai");
            location lWay = GetLocation(oWay);
            CreateObject(OBJECT_TYPE_CREATURE,"soulharvester",lWay);
            CreateObject(OBJECT_TYPE_CREATURE,"os_dead_kai",lWay);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

