//::///////////////////////////////////////////////
//:: UserDefined
//:: NW_DC_DOGCHICKD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script make the dog chase chickens.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oChicken = GetNearestObjectByTag("M2_CHICKEN",OBJECT_SELF,2);

    if (GetDistanceToObject(oChicken) > 3.0)
    {
        ClearAllActions();
//        AssignCommand(oChicken,ClearAllActions());
        AssignCommand(oChicken,ActionMoveAwayFromObject(OBJECT_SELF,TRUE));
        ActionMoveToObject(oChicken,TRUE);
        ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(100)));
    }
    else
    {
//        AssignCommand(oChicken,ClearAllActions());
        AssignCommand(oChicken,ActionMoveAwayFromObject(OBJECT_SELF,TRUE));
        PlayAnimation(ANIMATION_FIREFORGET_TAUNT);
        PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
        DelayCommand(3.0,SignalEvent(OBJECT_SELF,EventUserDefined(100)));
    }
}
