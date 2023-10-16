int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_PCKNOWSKOBOLDCAVE") == 1)
        return TRUE;
    return FALSE;
}
