//::///////////////////////////////////////////////
//:: Witch Wake: On Player Respawn
//:: WW_OnPCRespawn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When the player hits the Respawn button,
     kill them. This will trigger the OnDeath
     script.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastRespawnButtonPresser();
    effect eDeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oPC);
    PlayVoiceChat(VOICE_CHAT_DEATH, oPC);
}
