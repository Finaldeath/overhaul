int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bGaveFlame = GetLocalInt(OBJECT_SELF, "N_GAVE_FLAME");
    int iBraziersLit = GetLocalInt(oPC, "N_ACAD_TEST_BRAZ_LIT");
    if (bGaveFlame == TRUE &&
        iBraziersLit < 2)
    {
        return TRUE;
    }
    return FALSE;
}
