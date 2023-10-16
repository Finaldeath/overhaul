//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q2c24c_ud_hobgob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hobgoblin task master user defined events
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
        SetLocalInt(oPC,"OS_HEN_STORY",10);
        object oDylan = GetObjectByTag("q2_dylan");
        SetLocalInt(oDylan,"OS_DYLAN_PRISON",2);
        object oDoor = GetObjectByTag("q2c24c_side_door");
        SetLocked(oDoor,FALSE);

        AddJournalQuestEntry("q2_invaders", 20, oPC);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

