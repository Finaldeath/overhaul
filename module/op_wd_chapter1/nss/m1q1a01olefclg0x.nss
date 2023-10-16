int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(GetModule(),"NW_G_M1S1Plot") >= 100 ||
        GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Never")==60 ||
        GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Never")==80)
    {
        return TRUE;
    }
    return FALSE;
}
