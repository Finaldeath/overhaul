void main()
{
    object oPC = GetPCSpeaker();
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));


    effect eCon = EffectAbilityIncrease(ABILITY_CONSTITUTION,1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCon, oPC);

    SetLocalInt(GetPCSpeaker(),"DrankWine",10);
}
