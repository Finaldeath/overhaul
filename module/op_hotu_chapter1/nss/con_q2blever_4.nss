int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q2brodwhite");
    if (oRod == OBJECT_INVALID)
        return FALSE;
    SetLocalObject(OBJECT_SELF, "oRodWhite", oRod);
    return TRUE;
}
