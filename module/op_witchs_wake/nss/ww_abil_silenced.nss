//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Silenced
//:: WW_Abil_Silenced.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     As a result of a successful Silence: Cast
     Silence check, the NPC is under the effects
     of a Silence spell but has turned hostile.
     If he is still alive when the Silence effect
     wears off, the NPC will sound the alarm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(OBJECT_SELF);
    effect eSilence = EffectSilence();

    //Silence the NPC.
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSilence, OBJECT_SELF, 120.0);

    //Turn the NPC hostile.
    SetIsTemporaryEnemy(oPC);
    DetermineCombatRound();

    //Sound the alarm if I'm still alive once the Silence effect has worn off
    //(UserDefinedEvent #1701 on the current Area).
    DelayCommand(120.0, PlayVoiceChat(VOICE_CHAT_ENEMIES));
    DelayCommand(122.0, PlayVoiceChat(VOICE_CHAT_ATTACK));
    DelayCommand(122.0, SignalEvent(oArea, EventUserDefined(1701)));
}
