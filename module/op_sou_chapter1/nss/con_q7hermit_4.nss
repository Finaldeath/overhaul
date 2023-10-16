int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_PCKNOWSBLUMBERG") == 1)
        return TRUE;
    return FALSE;
}
