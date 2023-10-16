//::///////////////////////////////////////////////
//:: Witchwork 1: Fire Statue, Use Magic Device Failed (2 HP)
//:: WW1_FireStat_Dmg.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Injure the player for failing their Use Magic
     Device check on the Fire Statue.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eDamage = EffectDamage(2, DAMAGE_TYPE_FIRE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
}
