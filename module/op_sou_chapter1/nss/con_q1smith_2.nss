int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_nSmithHelmWait") == 2)
        return TRUE;
    return FALSE;
}
