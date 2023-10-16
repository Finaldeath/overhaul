// Glendir hasn't told the truth yet

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "q3_Glendir_Lie") == 1)
        return TRUE;
    return FALSE;
}
