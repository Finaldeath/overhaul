//::///////////////////////////////////////////////
//:: Name hx_slp_senwak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man wakes, Sensei enters.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
void RemoveEffects(object oSleep);
void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    object oSensei = GetObjectByTag("H2_Sensei");
    location lSensei = GetLocation(GetObjectByTag("hx_temple_sensei_wp"));
    location lPC = GetLocation(GetObjectByTag("hx_temple_pc_wp"));

    // Set Sensei as jumped.
    SetLocalInt(GetModule(), "bSenseiJumped", TRUE);

    // Wake the Sleeping Man.
    // Variable is not really dead, just means the invis object willnot start a conv
    // now that he is awake or gone.
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    SetLocalInt(oSleep, "bAwake", TRUE);
    RemoveEffects(oSleep);

    ActionPauseConversation();
    DelayCommand(1.0, FadeToBlack(oPC, FADE_SPEED_FASTEST));
    DelayCommand(2.0, AssignCommand(oSensei, ClearAllActions()));
    DelayCommand(2.2, AssignCommand(oSensei, ActionJumpToLocation(lSensei)));
    DelayCommand(2.2, AssignCommand(oPC, ActionJumpToLocation(lPC)));
    DelayCommand(2.3, AssignCommand(oSensei, ActionJumpToLocation(lSensei)));
    DelayCommand(2.5, AssignCommand(oPC, SetFacingPoint(GetPosition(oSleep))));
    DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
    DelayCommand(3.5, ActionResumeConversation());
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
