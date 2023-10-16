int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_BETRAYED_LYEN") == 1)
        return TRUE;

    return FALSE;
}
