//::///////////////////////////////////////////////
//:: Name hx_slp_wake_gen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man wakes.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
void RemoveEffects(object oSleep);
void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");

    // Wake the Sleeping Man.
    SetLocalInt(oSleep, "bAwake", TRUE);
    // Variable is not really dead, just means the invis object willnot start a conv
    // now that he is awake or gone.
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    RemoveEffects(oSleep);

    object oSensei = GetObjectByTag("H2_Sensei");
    int bSenseiValid = GetIsObjectValid(oSensei);
    int bSenseiDead = GetIsDead(oSensei);
    if (bSenseiValid == TRUE &&
        bSenseiDead == FALSE)
    {
        SetLocalInt(GetModule(), "bSenseiJumped", TRUE);
        ActionPauseConversation();
        location lJumpTo = GetLocation(GetObjectByTag("hx_temple_sensei_wp"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lJumpTo);
        AssignCommand(oSensei, ClearAllActions(TRUE));
        AssignCommand(oSensei, ActionJumpToLocation(lJumpTo));
        DelayCommand(1.0, ActionResumeConversation());
    }
}

void RemoveEffects(object oSleep)
{
    effect eEffect = GetFirstEffect(oSleep);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oSleep, eEffect);
        eEffect = GetNextEffect(oSleep);
    }
}
