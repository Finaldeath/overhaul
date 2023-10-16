//::///////////////////////////////////////////////
//:: Custom User Defined Event for gnoll sentinel
//:: q3_sentinel_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 heartbeat: play specific animation whether alarm sounded or not.
 101: increase listen skill
*/

#include "q3_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT)
    {
        if(GetIsInCombat() || GetPlot("Q3_JOURNAL_GNOLL_SLAVES") == 90)
            return;
        int nAlarm = GetLocalInt(GetArea(OBJECT_SELF), "Q3_ALARM_STATUS");
        //int nRand = Random(2);
        //if(nRand == 0)
        //    return; // so the animations play only half the time and not every round

        if(nAlarm == 0) // alarm not activated -> act bored
            ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED);
        else // alarm activated -> act alarmed
            ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 3.0);

    }
    else if (nEvent == 101)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE", 1);

        effect eInc = EffectSkillIncrease(SKILL_LISTEN, 20);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInc, OBJECT_SELF);
    }
    else if(nEvent == 102) // exit room
    {
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        SetLocalInt(OBJECT_SELF, "Q3_LEAVING_AREA", 1);
        ClearAllActions();
        ActionForceMoveToObject(oWP);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE, OBJECT_SELF);
    }
    else if(nEvent == EVENT_DIALOGUE)
    {
        int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
        if(nStatus == GNOLL_STATUS_CONTROL_TRIBE)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            AssignCommand(oPC, PlaySound("c_gnoll_bat1"));
            ClearAllActions();
            ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
        }
    }

}


