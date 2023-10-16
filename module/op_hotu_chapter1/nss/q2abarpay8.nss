void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(8, oPC);
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
}

