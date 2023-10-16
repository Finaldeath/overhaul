//::///////////////////////////////////////////////
//:: Custom User Defined Event for gnoll sleeper
//:: q3_sleeper_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 event 101: do a wakeup check
*/

#include "nw_i0_generic"
#include "q3_inc_plot"

void WakeupCheck(object oPC)
{
    if(GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        effect eSleep = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(eSleep))
        {
            if(GetEffectCreator(eSleep) == OBJECT_SELF)
            {
                // PC rolls move silently against the gnoll's listen skill.
                int nGnollRoll = d20();
                int nPCRoll = d20();
                int nListen = GetSkillRank(SKILL_LISTEN);
                int nMove = GetSkillRank(SKILL_MOVE_SILENTLY, oPC);
                int nGnollResult = nGnollRoll + nListen;
                int nPCResult = nPCRoll + nMove;
                if(GetStealthMode(oPC) == STEALTH_MODE_DISABLED)
                    nPCResult -= 4; // player has not entered stealth mode -> a -4 penalty

                //SpeakString("Gnoll's Listen roll=" + IntToString(nGnollResult) + " Your Move Silently result=" +IntToString(nPCResult));
                if(nGnollResult > nPCResult)
                {
                    FloatingTextStrRefOnCreature(40404, oPC);
                    RemoveEffect(OBJECT_SELF, eSleep);
                }
            }
            eSleep = GetNextEffect(OBJECT_SELF);
        }
    }

}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101)
    {
        object oPC = GetLocalObject(OBJECT_SELF, "PC_TO_CHECK");
        if(oPC != OBJECT_INVALID && GetDistanceBetween(oPC, OBJECT_SELF) <= 6.0)
        {
            WakeupCheck(oPC);
            //RemoveAmbientSleep();
            if(GetHasEffect(EFFECT_TYPE_SLEEP))
                return;
            int nAlarm = GetLocalInt(GetArea(OBJECT_SELF), "Q3_ALARM_STATUS");
            if(nAlarm == 0) // alarm did not sound
            {
                object oGong = GetNearestObjectByTag("Q3_GNOLL_ALARM_GONG");
                if(GetDistanceBetween(OBJECT_SELF, oGong) <= 10.0)
                {
                    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_RING_ALARM_ONCE");
                    if(nDoOnce == 1)
                         return;
                    SetLocalInt(OBJECT_SELF, "DO_RING_ALARM_ONCE", 1);

                    ClearAllActions();
                    DelayCommand(1.0, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 2.0));
                    DelayCommand(1.0, ActionSpeakStringByStrRef(40280));
                    DelayCommand(1.5, ActionMoveToObject(oGong, TRUE, 0.0));
                    DelayCommand(1.5, ActionDoCommand(SignalEvent(oGong, EventUserDefined(101))));
                    DelayCommand(2.0, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
                    DelayCommand(2.0, ActionAttack(oPC));
                    return;
                }
            }

        }
    }
    else if(nEvent == EVENT_DIALOGUE)
    {
        int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
        if(nStatus == GNOLL_STATUS_CONTROL_TRIBE)
            ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
    }

}


