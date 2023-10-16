int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nCharges = GetLocalInt(oPC, "X1_Q7ChargesToPayFor");
    int nAmount = nCharges * 100;
    if (GetGold(oPC) >= nAmount)
        return TRUE;
    return FALSE;
}
