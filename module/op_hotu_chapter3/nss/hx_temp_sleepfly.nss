//::///////////////////////////////////////////////
//:: Name hx_temp_sleepfly
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man flies in.
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
    location lLoc = GetLocation(oPC);

    SetLocalInt(GetModule(), "HX_SENSEIFLEES", TRUE);

    ActionPauseConversation();

    // Wake the Sleeping Man.
    SetLocalInt(oSleep, "bAwake", TRUE);
    RemoveEffects(oSleep);

    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisappearAppear(lLoc), oSleep, 2.0));

    DelayCommand(3.3, AssignCommand(oSleep, SetFacingPoint(GetPosition(oPC))));
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
