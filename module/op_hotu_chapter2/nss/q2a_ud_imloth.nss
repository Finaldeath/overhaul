//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2a_ud_imloth
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

void main()
{
    //Stop following the PC if the PC betrays the rebels
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;

    int nUser = GetUserDefinedEventNumber();

    if(nUser == 101) //Follow PC
    {

        object oToFollow = GetLocalObject(OBJECT_SELF, "oLeader");

        if (GetLocalInt(OBJECT_SELF, "nTalkToPC") == 1)
        {

            if (IsInConversation(OBJECT_SELF) == FALSE)
            {
                AssignCommand(oToFollow, ClearAllActions(TRUE));
                ActionStartConversation(oToFollow);
            }
        }

        DelayCommand(3.0, SignalEvent(OBJECT_SELF, EventUserDefined(101)));
    }


}

