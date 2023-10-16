void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(5, oPC);
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
}
