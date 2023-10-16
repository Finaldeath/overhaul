//::///////////////////////////////////////////////
//:: Witchwork 1: Elkentree, Do Damage (2 HP)
//:: WW1_Elktree_Dmg.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Raggletag pecks the player for 2 HP
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eDamage = EffectDamage(2, DAMAGE_TYPE_PIERCING);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
}
