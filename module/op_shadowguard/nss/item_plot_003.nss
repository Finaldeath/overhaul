void main()
{
    object o = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_003");

    object oPC = GetPCSpeaker();

    CreateItemOnObject("IT_PLOT_003", oPC);

    DestroyObject(o);
}
