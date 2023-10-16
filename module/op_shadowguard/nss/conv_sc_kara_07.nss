void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "IT_PLOT_037");

    DestroyObject(oItem);

    SetLocalInt(GetPCSpeaker(), "N_TOOK_BLOODSTONE", 0);
}
