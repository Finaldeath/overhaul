int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_SPIRIT_OFFERING") == 3)
        return TRUE;

    return FALSE;
}
