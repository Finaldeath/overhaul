int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q5rodofruler");
    if (GetIsObjectValid(oRod) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oRod", oRod);
        return TRUE;
    }
    return FALSE;
}
