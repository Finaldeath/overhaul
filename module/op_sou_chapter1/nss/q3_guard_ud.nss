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
    if(nEvent == 102) // exit room
    {
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        SetLocalInt(OBJECT_SELF, "Q3_LEAVING_AREA", 1);
        ClearAllActions();
        ActionForceMoveToObject(oWP);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE, OBJECT_SELF);
    }
    if (nEvent == EVENT_HEARTBEAT)
    {
        // have the gnoll play the taunt and forcefull talk animation when there is no agreement.
        if(GetIsInCombat())
            return;

        int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
        if(nStatus != GNOLL_STATUS_INIT)
            return; // play the animation only for init status

        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDistance = GetDistanceBetween(oPC, OBJECT_SELF);
        if(oPC == OBJECT_INVALID || fDistance >= 25.0)
            return;
        SetFacingPoint(GetPosition(oPC));
        int nRand = Random(4) + 1;
        if(nRand >= 3)
            return;
        if(nRand == 1)
            ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
        else
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0);



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
    else if(nEvent == 1005 || nEvent == 1003) // attacked -> kobolds come to help
    {
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(103));
    }
    /*
    else if (nEvent == 101)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ALARM_ONCE", 1);

        effect eInc = EffectSkillIncrease(SKILL_LISTEN, 20);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInc, OBJECT_SELF);
    } */

}


