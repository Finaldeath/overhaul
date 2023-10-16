void main()
{
    object oPC = GetPCSpeaker();

    object oMark = GetNearestObjectByTag("HENCH_MARK", oPC);

    object oSword = GetItemPossessedBy(oMark, "IT_WEAP_GSWO_001");

    AssignCommand(oMark, ActionEquipItem(oSword, INVENTORY_SLOT_RIGHTHAND));
}
