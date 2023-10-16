int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q2brodgreen");
    if (oRod == OBJECT_INVALID)
        return FALSE;
    SetLocalObject(OBJECT_SELF, "oRodGreen", oRod);
    return TRUE;
}
