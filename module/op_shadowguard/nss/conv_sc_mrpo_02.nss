void main()
{
    object oPC = GetPCSpeaker();

    object oChest = GetNearestObjectByTag("PLAC_MRPO_CHEST_00");

    string s = "IT_PLOT_004";

    object oItem = GetItemPossessedBy(oChest, s);

    DestroyObject(oItem);

    CreateItemOnObject(s, oPC);
}
