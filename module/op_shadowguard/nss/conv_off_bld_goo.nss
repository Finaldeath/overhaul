int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING") == 1)
        return TRUE;

    return FALSE;
}
