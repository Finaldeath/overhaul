//::///////////////////////////////////////////////
//:: User Defined
//:: NW_GD_DOGD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have the guard dog follow
    a PC who enters the guarded area until they
    leave.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"NW_L_Intruder");
    object oHome = GetNearestObjectByTag("WP_GUARDDOG");

    if (GetIsObjectValid(oIntruder) &&
        GetDistanceToObject(oIntruder) > 3.0)
    {
        ClearAllActions();
        ActionMoveToObject(oIntruder,TRUE);
        ActionDoCommand(PlayVoiceChat(VOICE_CHAT_BATTLECRY1));
        ActionDoCommand(PlayAnimation(ANIMATION_FIREFORGET_TAUNT));
    }
    else
    {
        ClearAllActions();
        ActionMoveToObject(oHome);
        ActionWait(1.0);
        ActionDoCommand(SetFacing(GetFacing(oHome)));
    }
}
