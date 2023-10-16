// Golem machine activator: single use, unlocks the table

void main()
{
    object oTarget = GetItemActivatedTarget();
    object oItem = GetItemActivated();
    object oPC = GetItemActivator();

    if(GetIsPC(oTarget))
        oTarget = GetObjectByTag("q4d_golem_machine");

    if(GetTag(oTarget) == "q4d_golem_machine")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        SetLocked(oTarget, FALSE);
        DestroyObject(oItem);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionInteractObject(oTarget));
    }
}
