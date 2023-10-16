int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_gilles")>0)
    {
        return TRUE;
    }
    return FALSE;
}
