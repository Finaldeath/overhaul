//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Action - Activate Collar)
//:: A_Ashtara_Collar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the slaver's collar to show the
     player that he means business.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eKnockdown = EffectKnockdown();
    effect eDamage = EffectDamage(10);

    ActionPauseConversation();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oPC, 10.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    PlayVoiceChat(VOICE_CHAT_PAIN3, oPC);

    //Only resume conversation if the PC is still alive.
    if (GetIsDead(oPC) == FALSE)
    {
        DelayCommand(0.5, ActionResumeConversation());
    }
}
