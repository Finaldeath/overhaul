int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING") == 3)
        return TRUE;

    return FALSE;
}
