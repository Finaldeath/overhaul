void main()
{
    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(oPC, "IT_PLOT_037");

    DestroyObject(oItem);
}
