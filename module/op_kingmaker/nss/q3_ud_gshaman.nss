//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_gshaman
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shaman user defined event
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
        object oPC = GetFirstPC();
        if(GetLastPerceived()==oPC)
        {
            ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
        }
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
    else if(nUser ==302)
    {
        object oInjured;
        int nCount;
        for(nCount = 0; nCount < 7; nCount++)
        {
            oInjured = GetObjectByTag("q3_goblininjured",nCount);
            if(GetIsObjectValid(oInjured))
            {
                int nCurr = GetCurrentHitPoints(oInjured);
                int nMax = GetMaxHitPoints(oInjured);
                if(nCurr!=nMax)//if the goblin is still injured
                {
                    ActionMoveToObject(oInjured);
                    ActionCastSpellAtObject(SPELL_CURE_MODERATE_WOUNDS,oInjured,METAMAGIC_ANY,TRUE);
                    event eHeal = EventUserDefined(301);//sets the goblin hostile to the PC
                    ActionDoCommand(SignalEvent(oInjured, eHeal));
                }
            }
        }
        ActionDoCommand(ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE));
    }

}

