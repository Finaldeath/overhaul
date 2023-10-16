//::///////////////////////////////////////////////
//:: Name q2_ud_assassin3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Assassin On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {
        object oPC = GetFirstPC();
        int nCount = GetLocalInt(oPC,"OS_ASSASSIN")+1;
        SetLocalInt(oPC,"OS_ASSASSIN",nCount);
        if(nCount >= 2)
        {
            object oGuard = GetNearestObjectByTag("q2_keepguard");
            object oGuard1 = GetNearestObjectByTag("q2_keepguard1");
            object oWay = GetObjectByTag("q2_way_keepgrd");
            object oWay1 = GetObjectByTag("q2_way_keepgrd1");
            AssignCommand(oGuard,ClearAllActions(TRUE));
            AssignCommand(oGuard1,ClearAllActions(TRUE));
            AssignCommand(oGuard,ActionMoveToObject(oWay));
            AssignCommand(oGuard1,ActionMoveToObject(oWay1));
        }
    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }


}


