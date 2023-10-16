//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
    Drow guard at area entrance: run to warn all other drow
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
        // First time perceives players: run to alarm camp

        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE", 1);

        ClearAllActions();
        PlayVoiceChat(VOICE_CHAT_ATTACK);
        object oWP = GetWaypointByTag("q6_wp_drow_alarm");
        object oFacing = GetWaypointByTag("q6_wp_set_facing");
        ActionMoveToObject(oWP, TRUE, 0.0);
        ActionDoCommand(PlayVoiceChat(VOICE_CHAT_ATTACK));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL);
        ActionDoCommand(DetermineCombatRound());
        ActionDoCommand(SetFacingPoint(GetPosition(oFacing)));
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);

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


