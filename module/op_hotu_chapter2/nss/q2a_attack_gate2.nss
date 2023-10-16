// Player attacks the inner gate - destroy the gate to trigger the betrayal

void main()
{
    object oPC = GetLastAttacker();
    if(!GetIsPC(oPC))
        return;

    if(GetPlotFlag(OBJECT_SELF) == TRUE)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DESTROY_SELF_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_DESTROY_SELF_ONCE", 1);

    effect eDamage = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF);
    //DestroyObject(OBJECT_SELF);
}
