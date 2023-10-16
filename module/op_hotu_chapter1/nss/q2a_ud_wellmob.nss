//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2a_ud_wellmob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Subtract from the count of number of enemies for
    the Yawning Portal attack cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Jan 9 /03
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
        if (GetLocalInt(OBJECT_SELF, "nDead") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDead", 1);
            SetLocalInt(GetModule(), "X2_wellmobcount", GetLocalInt(GetModule(), "X2_wellmobcount") - 1);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

