int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_nSmithHelmWait") == 1)
        return TRUE;
    return FALSE;
}
