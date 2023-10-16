int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_SPIRIT_OFFERING") == 2)
        return TRUE;

    return FALSE;
}
