int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Never") > 0 &&
        GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Never") < 60)
    {
        return TRUE;
    }
    return FALSE;
}


