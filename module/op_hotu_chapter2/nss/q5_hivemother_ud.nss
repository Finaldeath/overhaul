//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hive Mother user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On:
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"

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
        // Bring in more beholders from the holes every 3 rounds to a max of 5:
        object oWP = GetNearestObjectByTag("q5b_wp_beholder_join", GetFirstPC());
        int nTotal = GetLocalInt(OBJECT_SELF, "TOTAL");
        if(nTotal == 5)
            return;
        int nRoundsCount = GetLocalInt(OBJECT_SELF, "ROUNDS_COUNT");
        nRoundsCount++;
        if(nRoundsCount == 3)
        {
            object oBeholder = CreateObject(OBJECT_TYPE_CREATURE, "q5_beholder2", GetLocation(oWP));
            nRoundsCount = 0;
            nTotal++;
            SetLocalInt(OBJECT_SELF, "TOTAL", nTotal);
        }
        SetLocalInt(OBJECT_SELF, "ROUNDS_COUNT", nRoundsCount);


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
        SetLocalInt(GetModule(), "x2_plot_beholders_out", 1);
        AddJournalQuestEntry("q2_beholder", 99, GetFirstPC());
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

