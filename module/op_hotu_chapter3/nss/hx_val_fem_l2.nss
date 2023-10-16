//PC is female and romance is not yet complete.
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bGender = GetGender(oPC);
    int iRomance = GetLocalInt(GetModule(), "iValenRomance");

    if (bGender == GENDER_FEMALE &&
        iRomance < 2)
    {
        return TRUE;
    }
    return FALSE;
}
