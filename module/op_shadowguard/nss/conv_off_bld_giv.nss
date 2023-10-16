int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iBlood = GetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING");
    int iBraziersLit = GetLocalInt(oPC, "N_ACAD_TEST_BRAZ_LIT");
    if (iBlood > 0 &&
        iBraziersLit < 2)
    {
        return TRUE;
    }
    return FALSE;
}
