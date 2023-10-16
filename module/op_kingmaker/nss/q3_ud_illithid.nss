//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_illithid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Illithid user defined event
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
        object oPC = GetFirstPC();
        object oWay1 = GetWaypointByTag("q2_way_pc");
        object oWay2 = GetWaypointByTag("q2_way_grandpa");
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,
            "q3ai_mw_intro", GetLocation(oWay2));

        object oDoor = GetWaypointByTag("x2_doormed3");

        SetLocalInt(GetModule(), "OS_MW_FINAL", 1);

        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionForceMoveToObject(oWay1));

        AssignCommand(oDoor, SetLocked(OBJECT_SELF, FALSE));
        AssignCommand(oMW, DelayCommand(1.0, ActionStartConversation(oPC)));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

