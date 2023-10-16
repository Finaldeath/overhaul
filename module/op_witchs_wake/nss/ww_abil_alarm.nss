//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Alarm Triggered
//:: WW_Abil_Alarm.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     As a result of a failed Silence check, the
     player has allowed the NPC to trigger the
     alarm system.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oArea = GetArea(OBJECT_SELF);

    PlayVoiceChat(VOICE_CHAT_ENEMIES);
    DelayCommand(2.0, PlayVoiceChat(VOICE_CHAT_ATTACK));

    //Signal the UserDefinedEvent on the current area.
    //Custom alarm reactions can be scripted there.
    //EventNumber = 1701
    SignalEvent(oArea, EventUserDefined(1701));
}
