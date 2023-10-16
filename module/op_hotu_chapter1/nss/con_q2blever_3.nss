int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q2brodred");
    if (oRod == OBJECT_INVALID)
        return FALSE;
    SetLocalObject(OBJECT_SELF, "oRodRed", oRod);
    return TRUE;
}
