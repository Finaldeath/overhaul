void main()
{
    SetLocalInt(GetArea(OBJECT_SELF), "START_ARMAND_BATTLE", 1);
    object oArmand = GetNearestObjectByTag("q3_armand");
    AssignCommand(oArmand, ClearAllActions());
    effect eSpeed = EffectMovementSpeedIncrease(50);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpeed, oArmand);
}
