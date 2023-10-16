int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q2brodyellow");
    if (oRod == OBJECT_INVALID)
        return FALSE;
    SetLocalObject(OBJECT_SELF, "oRodYellow", oRod);
    return TRUE;
}
