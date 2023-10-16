int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "nDurnanGaveUMPermission") == 0)
        return TRUE;
    return FALSE;
}
