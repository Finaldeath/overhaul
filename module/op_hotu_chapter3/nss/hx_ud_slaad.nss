//::///////////////////////////////////////////////
//:: Name hx_ud_slaad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Handles the portal when slaad dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
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
        object oSelf = OBJECT_SELF;
        AddJournalQuestEntry("XP2_Guardians", 40, GetFirstPC(), TRUE, TRUE);
        SignalEvent(GetArea(oSelf), EventUserDefined(4444));
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


