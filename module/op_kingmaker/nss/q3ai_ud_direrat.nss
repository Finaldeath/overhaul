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
#include "inc_remeffect"

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
        location lPC = GetLocation(oPC);
        int nDead = GetLocalInt(oPC,"Q3AI_CAL_RATS_DEAD")+1;
        SetLocalInt(oPC,"Q3AI_CAL_RATS_DEAD",nDead);
        RemovePoly(oPC);

        if(nDead >=2)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            SetLocalInt(oPC, "OS_MW_RATSDEAD", 1);
            object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", lPC);
            DelayCommand(1.0, AssignCommand(oMW, ActionStartConversation(oPC)));
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

