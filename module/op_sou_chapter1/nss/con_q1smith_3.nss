int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_nSmithHelmWait") == 2)
    {
        int nAmount = GetLocalInt(OBJECT_SELF, "nHelmPrice");
        if (GetGold(oPC) >= nAmount)
            return TRUE;
    }

    return FALSE;
}
