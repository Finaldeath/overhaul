//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q1_ud_firemonst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fire monster's user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
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
        object oKai = GetObjectByTag("os_hen_kai");
        if(GetLastDamager()==oKai)
        {
            effect eDeath = EffectDeath(TRUE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,OBJECT_SELF);
        }
    }
    else if(nUser == 1007) // DEATH
    {
        object oKai = GetObjectByTag("os_hen_kai");
        object oPC = GetFirstPC();
        SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",70);
        AssignCommand(oKai,ClearAllActions(TRUE));
        AssignCommand(oKai,ActionJumpToObject(oPC));
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oKai,ActionStartConversation(oPC));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

