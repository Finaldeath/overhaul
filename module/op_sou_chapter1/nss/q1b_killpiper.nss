// chance for the guards to comment on Piper

int StartingConditional()
{
    int nKill = GetLocalInt(GetModule(), "X1_PIPERQUEST");
    int nRoll = d100();

    if ((nKill == 80) && (nRoll > 50) && GetLocalInt(OBJECT_SELF, "nPiperComment") != 1)
    {
        return TRUE;
    }
    return FALSE;
}
