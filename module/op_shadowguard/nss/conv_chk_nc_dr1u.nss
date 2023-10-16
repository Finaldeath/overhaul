//Return TRUE if they're not wearing a Nightcrawler uniform,
//and it's the first door.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sUniform = GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC));

    if (sUniform != "IT_ARM_CLOTH_801")
    {
        return TRUE;
    }

    return FALSE;
}
