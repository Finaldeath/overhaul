//::///////////////////////////////////////////////
//:: Witchwork 1: Rock Climb Failed (1 HP)
//:: WW1_ClimbFail_01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Injure the player for failing their climb
     attempt (1 HP)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eDamage = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
}
