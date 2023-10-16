//::///////////////////////////////////////////////
//:: Entered Ruins
//:: EnteredRuins.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Applies a Curse VFX and text bubble to the
    player. Sets the "RuinsEntered" local for use
    with death scripts.
*/
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    int iEnteredRuins = GetLocalInt(GetModule(), "EnteredRuins");

    if (GetIsPC(oEnterer) == TRUE)
    {
        if (iEnteredRuins == FALSE)
        {
            effect eEffect = EffectVisualEffect(EFFECT_TYPE_CURSE);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oEnterer);
            AssignCommand(oEnterer, SpeakString("You feel as if you have disturbed something..."));
            SetLocalInt(GetModule(), "EnteredRuins", TRUE);
        }
    }
}
