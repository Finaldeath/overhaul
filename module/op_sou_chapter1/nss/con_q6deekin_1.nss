int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_DeekinNotInBlumberg") == 1)
        return TRUE;
    return FALSE;
}
