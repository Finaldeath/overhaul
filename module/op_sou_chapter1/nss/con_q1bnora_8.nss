int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bfamily") == 60 && GetLocalInt(oPC, "X1_Q1BNoraFearsPC") != 1)
        return TRUE;
    return FALSE;
}
