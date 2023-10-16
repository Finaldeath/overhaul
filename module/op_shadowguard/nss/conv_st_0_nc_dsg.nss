int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC)) == "IT_ARM_CLOTH_801")
        return TRUE;

    return FALSE;
}
