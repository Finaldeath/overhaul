int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nCharges = GetLocalInt(oPC, "X1_Q7ChargesToPayFor");
    if (nCharges > 0)
    {
        SetCustomToken(501, IntToString(nCharges * 100));
        return TRUE;
    }
    return FALSE;
}
