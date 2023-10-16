//Set a variable on the PC that he is talking to the Elder Brain so
//that on save and load - the conversation can be restarted.
//act_q2dbrain_1
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2DTalkingToBrain", 1);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 6.0);
}
