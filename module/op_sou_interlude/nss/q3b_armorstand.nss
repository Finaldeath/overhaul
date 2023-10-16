// animate armor stand and attack -> notice that it may attack slaadi also

void RemoveEffects(object oObject)
{
    effect eEffect = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oObject, eEffect);
        eEffect = GetNextEffect(oObject);
    }
}

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oArmor = GetNearestObjectByTag("Q3B_ARMOR_STAND");
    SetPlotFlag(oArmor, FALSE);
    object oEnter = GetEnteringObject();
    RemoveEffects(oArmor);
    AssignCommand(oArmor, PlaySound("c_horror_atk1"));
    SetIsTemporaryEnemy(oEnter, oArmor);
    AssignCommand(oArmor, ActionAttack(oEnter));

}
