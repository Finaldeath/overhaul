//::///////////////////////////////////////////////
//:: Tasha's Hideous Laughter: Effect Run Script
//:: op_s_tashlaughrs.nss
//:://////////////////////////////////////////////
/*
    Sets the animations and plays the laughter!
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void SetLaughAnimations(object oTarget, string sAnimation);

void main()
{
    int nRunScript = GetLastRunScriptEffectScriptType();
    if (nRunScript == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_APPLIED)
    {
        // Sets the animations
        SetLaughAnimations(OBJECT_SELF, "tlklaugh");

        PlayVoiceChat(VOICE_CHAT_LAUGH);
    }
    else if (nRunScript == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        // Removes the animations after a short additional display (to cover the
        // "standing up" from the knockdown effect)
        DelayCommand(0.5, SetLaughAnimations(OBJECT_SELF, ""));
    }
    else if (nRunScript == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        PlayVoiceChat(VOICE_CHAT_LAUGH);
    }
}

void SetLaughAnimations(object oTarget, string sAnimation)
{
    ReplaceObjectAnimation(oTarget, "kdbck", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckps", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckdmg", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckdie", sAnimation);
    ReplaceObjectAnimation(oTarget, "gutokdb", sAnimation);
    ReplaceObjectAnimation(oTarget, "gustandb", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfnt", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntps", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntdmg", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntdie", sAnimation);
    ReplaceObjectAnimation(oTarget, "gutokdf", sAnimation);
    ReplaceObjectAnimation(oTarget, "gustandf", sAnimation);
    ReplaceObjectAnimation(oTarget, "deadfnt", sAnimation);
    ReplaceObjectAnimation(oTarget, "deadbck", sAnimation);
}
