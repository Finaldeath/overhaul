void main()
{
    object o = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_003");

    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, TakeGoldFromCreature(50, oPC));

    CreateItemOnObject("IT_PLOT_003", oPC);

    DestroyObject(o);
}
