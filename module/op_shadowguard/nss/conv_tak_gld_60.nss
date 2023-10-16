void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, TakeGoldFromCreature(60, oPC));
}
