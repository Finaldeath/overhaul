//Set a variable on the PC that he is talking to the Elder Brain so
//that on save and load - the conversation can be restarted.
//q2d_braincon_nrm
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2DTalkingToBrain", 0);

    //Remove cutscene Immobalize effect from the PC (put on when talking to the brain
    //after the illusionary forest
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
}
