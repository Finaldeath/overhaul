int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_SiegeUnsafeToLoad") == 1 || (GetLocalInt(GetModule(), "X2_Q2ABattle2Started") == 1 && GetLocalInt(OBJECT_SELF, "nWave2Ready") == 0))
    {
        return TRUE;
    }
    return FALSE;
}
