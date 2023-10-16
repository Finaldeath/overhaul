//::///////////////////////////////////////////////
//:: q2_ud_typhus
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Typhus On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 03
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    object oDeus = GetObjectByTag("q2_deus");
    object oMac = GetObjectByTag("q2_mac");
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
        if(GetLastDamager()==oDeus
            || GetLastDamager()==oMac)
        {
            effect eDeath = EffectDeath(FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,OBJECT_SELF);
        }
    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {

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


