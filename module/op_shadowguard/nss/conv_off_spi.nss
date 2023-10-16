int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_SPIRIT_OFFERING") > 0)
        return TRUE;

    return FALSE;
}
