
//::///////////////////////////////////////////////
//:: Cut 10 Dwarf User Defined Event
//:: FileName cut10_ud_dwar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 10 Dwarf Warrior Heartbeat.
    If not in combat - attempt to get to middle of
    the yawning portal
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov/26/02
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oTarget=GetObjectByTag("cut1_attack_station");
        if(!GetIsInCombat())
        {
            ClearAllActions();
            AssignCommand(OBJECT_SELF, ActionMoveToObject(oTarget, TRUE));
        }
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


