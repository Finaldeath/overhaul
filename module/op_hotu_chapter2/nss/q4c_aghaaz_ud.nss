//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined events for Aghaaz
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 1.8.2003
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"
#include "x2_inc_globals"

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
        if(GetPlot("q4_ferron") == 10)
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
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
        SetGlobalInt("x2_plot_golem2_in", 0); // no more golems from him
        RemoveJournalQuestEntry("q4_aghaaz", GetFirstPC());
        AddJournalQuestEntry("q2_maker", 55, GetFirstPC());
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

