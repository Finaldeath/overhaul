//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Held
//:: WW_Abil_Held.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     As a result of a successful Silence: Cast
     Hold Person check, the NPC is under the
     effects of a Hold Person spell and has turned
     hostile. If he is still alive when the Hold
     effect wears off, the NPC will sound the
     alarm.
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
    effect eHold = EffectParalyze();
    effect eVFX = EffectVisualEffect(VFX_IMP_DAZED_S);

    //Silence the NPC.
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHold, OBJECT_SELF, 60.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, OBJECT_SELF, 60.0);

    //Turn the NPC hostile.
    SetIsTemporaryEnemy(oPC);
    DetermineCombatRound();

    //Sound the alarm if I'm still alive once the Silence effect has worn off
    //(UserDefinedEvent #1701 on the current Area).
    DelayCommand(60.0, PlayVoiceChat(VOICE_CHAT_ENEMIES));
    DelayCommand(62.0, PlayVoiceChat(VOICE_CHAT_ATTACK));
    DelayCommand(62.0, SignalEvent(oArea, EventUserDefined(1701)));
}
