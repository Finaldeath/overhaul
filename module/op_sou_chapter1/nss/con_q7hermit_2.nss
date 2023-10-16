int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_Q7_IMAPENGUIN") == 1)
    {
        int nCharges = GetLocalInt(oPC, "X1_Q7ChargesToPayFor");
        SetCustomToken(501, IntToString(nCharges * 100));
        return TRUE;
    }
    return FALSE;
}
