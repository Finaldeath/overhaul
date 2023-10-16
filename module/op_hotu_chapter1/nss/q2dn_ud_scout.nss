//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName:
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void SoundAlarm();

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //if PCs have been spotted - there's nothing to do
        if (GetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered") > 1)
        return;
        //if a PC has not yet been spotted and we are checking a tripped alarm.
        //run to the alarm and look around for 12 seconds before returning to post
        if (GetLocalInt(OBJECT_SELF, "nCheckingAmbush") == 1)
        {
            object oTarget = GetLocalObject(OBJECT_SELF, "oAlarmTarget");
            if (GetDistanceToObject(oTarget) < 2.0)
            {
                object oPost = GetWaypointByTag("wp_q2dn_scoutpost");
                PlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 3.0);
                DelayCommand(3.0, SetFacing(90.0));
                DelayCommand(4.0, PlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 3.0));
                DelayCommand(7.0, ActionMoveToObject(oPost));
                SetLocalInt(OBJECT_SELF, "nCheckingAmbush", 0);
                SetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered", 0);
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        if (GetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered") > 1)
        return;

        if (GetLastPerceptionSeen() == TRUE)
        {
            object oPC = GetLastPerceived();
            if (GetIsPC(oPC) == TRUE)
            {
                SetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered", 2);
                SpeakStringByStrRef(84088);
                ClearAllActions(TRUE);
                SoundAlarm();
                DelayCommand(6.0, DetermineCombatRound());
            }
        }

    }


}

void SoundAlarm()
{
    object oSpellTarget = GetObjectByTag("q2dn_alarmtarget");
    ActionCastSpellAtObject(SPELL_FIREBALL, oSpellTarget, METAMAGIC_ANY, TRUE);
    object oArea = GetArea(OBJECT_SELF);
    SignalEvent(oArea, EventUserDefined(101));
    //float fDelay = GetDistanceToObject(oSpellTarget)/10;
    //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), oSpellTarget));

}

