//::///////////////////////////////////////////////
//:: Name hx_temple_senwak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei and PC wake the Sleeping Man.
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
    location lSensei = GetLocation(GetObjectByTag("hx_temple_sensei_wp"));
    location lPC = GetLocation(GetObjectByTag("hx_temple_pc_wp"));

    // Wake the Sleeping Man.
    SetLocalInt(oSleep, "bAwake", TRUE);
    RemoveEffects(oSleep);

    ActionPauseConversation();
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(1.2, ActionJumpToLocation(lSensei));
    DelayCommand(1.2, AssignCommand(oPC, ActionJumpToLocation(lPC)));
    DelayCommand(1.5, AssignCommand(oPC, SetFacingPoint(GetPosition(oSleep))));
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
    DelayCommand(2.5, ActionResumeConversation());
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
