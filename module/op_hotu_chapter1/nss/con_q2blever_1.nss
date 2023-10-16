int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q2brodblue");
    if (oRod == OBJECT_INVALID)
        return FALSE;
    SetLocalObject(OBJECT_SELF, "oRodBlue", oRod);
    return TRUE;
}
