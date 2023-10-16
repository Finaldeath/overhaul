//The Valsharess will initiate with the dreaming PC when the PC enters.
//Put dream like effects on PC...
//q2a9_enter_area
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsDM(oPC) == TRUE)
        return;
    if (GetIsPC(oPC) == FALSE)
        return;

    object oVal = GetObjectByTag("q2adreammatron");
    AssignCommand(oPC, ClearAllActions(TRUE));
    effect eEffect = EffectCutsceneImmobilize();
    AssignCommand(oVal, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC));
    DelayCommand(2.0, AssignCommand(oVal, ActionStartConversation(oPC)));
}
