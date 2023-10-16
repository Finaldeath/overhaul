void main()
{
    string s;

    s = "IT_MISC_BOOT_901";

    object oBoots = CreateItemOnObject(s, GetPCSpeaker());

    AssignCommand(GetPCSpeaker(), ActionEquipItem(oBoots, INVENTORY_SLOT_BOOTS));
}
