int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_GW_DEAD") == 1)
        return TRUE;

    return FALSE;
}
