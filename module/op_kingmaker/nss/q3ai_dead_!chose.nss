//::///////////////////////////////////////////////
//:: Dead Not Chosen
//:: q3ai_dead_!chose
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The henchmen was not chosen to survive
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oModule = GetModule();
    object oPC = GetFirstPC();
    object oSelf = OBJECT_SELF; //GetLastSpeaker();
    int nNot = GetLocalInt(oModule,"Q3AI_NOT_CHOSEN")+1;
    string sMSG;
    effect eEffect1 = EffectVisualEffect(VFX_IMP_HARM);
    effect eEffect2 = EffectVisualEffect(VFX_IMP_RESTORATION);
    float fTimer = 0.5f;

    SetLocalInt(oModule,"Q3AI_NOT_CHOSEN", nNot);
    GiveXPToCreature(oPC,200);

    sMSG = "You have obtained the soul of a follower";
    FloatingTextStringOnCreature(sMSG, oPC);
    sMSG = "You can now resurrect a henchman";
    FloatingTextStringOnCreature(sMSG, oPC);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect1, oSelf);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect2, oPC);

    // if the un~chosen is Kaidala take the soul harvester too
    if(GetTag(oSelf) == "os_dead_kai")
    {
        effect eDisappear = EffectDisappear();
        effect eGhost = EffectCutsceneGhost();
        effect eEffect3 = EffectVisualEffect(VFX_FNF_PWKILL);
        object oSoulHarvester = GetObjectByTag("q1_soulharvester");

        SetLocalInt(oSoulHarvester, "KAIDALA_SACKED", TRUE);

        fTimer = 4.5f;
        PlayVoiceChat(VOICE_CHAT_LAUGH, oSoulHarvester);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oSelf);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oSoulHarvester);

        DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect3, oSelf));
        DelayCommand(1.5, AssignCommand(oSoulHarvester, ActionMoveToObject(oSelf)));

        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisappear, oSelf));
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisappear, oSoulHarvester));
    }

    DelayCommand(fTimer, DestroyObject(oSelf));
}
