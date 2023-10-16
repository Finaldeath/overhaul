void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, TakeGoldFromCreature(50, oPC));
}
