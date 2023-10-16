int StartingConditional()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    int iGender = GetGender(oPC);
    if (iGender == GENDER_MALE)
    {
        return TRUE;
    }
    return FALSE;
}
