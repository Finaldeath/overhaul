//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2a_ud_herald
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Herald's User Defined Event.
    Forces the Herald to follow the PC about the battlefield
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 19/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_plot"

void main()
{
    //Stop following the PC if the PC betrays the rebels
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;

    int nUser = GetUserDefinedEventNumber();

    if(nUser == 101) //Follow PC
    {

        if (GetLocalInt(OBJECT_SELF, "nDoNotFollow") == 1)
        {
            ClearAllActions();
            return;
        }

        object oToFollow = GetLocalObject(OBJECT_SELF, "oLeader");
        //if the PC attacks the gates - stop following him
        if (GetLocalInt(GetModule(), "X2_PCPhase1Betray") == 1)
        {
            ClearAllActions();
            SetLocalObject(OBJECT_SELF, "oLeader", OBJECT_INVALID);
            SetLocalInt(OBJECT_SELF, "nDoNotFollow", 1);
            SpeakStringByStrRef(85731);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(OBJECT_SELF));
            DestroyObject(OBJECT_SELF, 1.5);
            return;
        }

        //Do Not Follow PC during cutscenes
        if (GetActiveCutsceneNum() > 0)
            ClearAllActions();

        if (GetLocalInt(OBJECT_SELF, "nTalkToPC") == 1)
        {
            AssignCommand(oToFollow, ClearAllActions(TRUE));
            JumpToObject(oToFollow);
            DelayCommand(2.0, ActionStartConversation(oToFollow));
        }
        else
        {
            if (GetDistanceToObject(oToFollow) > 5.0)
            {
                ActionForceFollowObject(oToFollow, 2.0);
            }
            else
            {
                if (IsInConversation(OBJECT_SELF) == FALSE)
                    ClearAllActions();
            }
        }
        DelayCommand(3.0, SignalEvent(OBJECT_SELF, EventUserDefined(101)));
    }


}

