//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"

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
        object oMaiden = GetObjectByTag("q3_DrowHandmaiden");
        object oElite = GetObjectByTag("q3_EliteDrowWarrior");
        object oWizard1 = GetNearestObjectByTag("q3_DrowWizard", OBJECT_SELF, 1);
        object oWizard2 = GetNearestObjectByTag("q3_DrowWizard", OBJECT_SELF, 2);

        SignalEvent(oMaiden, EventUserDefined(101));
        SignalEvent(oElite, EventUserDefined(101));
        SignalEvent(oWizard1, EventUserDefined(101));
        SignalEvent(oWizard2, EventUserDefined(101));
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
    else if(nUser == 101)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_HELP_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_HELP_ONCE", 1);

        if(GetIsInCombat(OBJECT_SELF))
            return;
        object oHelpWP = GetNearestObjectByTag("q3c_wp_drow_help");
        if(GetTag(OBJECT_SELF) == "q3_DrowHandmaiden")
        {
            ActionMoveToObject(oHelpWP, TRUE, 0.0);
            ActionCastSpellAtObject(SPELL_REGENERATE, OBJECT_SELF);
            ActionCastSpellAtObject(SPELL_SUMMON_CREATURE_VII, OBJECT_SELF);
            ActionCastSpellAtObject(SPELL_DIVINE_POWER, OBJECT_SELF);
            ActionCastSpellAtObject(SPELL_BATTLETIDE, OBJECT_SELF);
            ActionDoCommand(DetermineCombatRound());
        }
        else
        {
            ActionMoveToObject(oHelpWP, TRUE, 0.0);
            ActionDoCommand(DetermineCombatRound());
        }

    }


}


