//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_duerfire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined events for Duergar Fire Elemental
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
        object oSpell = GetObjectByTag("q3_duerspell");
        if(GetLocalInt(oSpell,"OS_DUERGAR_SPELL")==10)
        {
            SetLocalInt(oSpell,"OS_DUERGAR_SPELL",0);
            event eFire = EventUserDefined(305);
            SignalEvent(oSpell,eFire);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

