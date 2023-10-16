// the PC has the Ice Phylactery

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "x1_ice_phylac");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalObject(oPC, "X1_Phylac", oItem);
        return TRUE;
    }
    return FALSE;
}
