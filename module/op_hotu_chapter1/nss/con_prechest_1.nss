int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_PreAssassin") == 0)
        return TRUE;
    return FALSE;
}
