int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iSpirit = GetLocalInt(oPC, "N_ST_0_SPIRIT_OFFERING");
    int iBraziersLit = GetLocalInt(oPC, "N_ACAD_TEST_BRAZ_LIT");
    if (iSpirit > 0 &&
        iBraziersLit < 2)
    {
        return TRUE;
    }
    return FALSE;
}
