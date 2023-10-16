// chance for the guards to comment on Piper

int StartingConditional()
{
    int nKill = GetLocalInt(GetModule(), "X1_PIPERQUEST");


    if (nKill == 80 && GetLocalInt(OBJECT_SELF, "nPiperComment") != 1)
    {
        return TRUE;
    }
    return FALSE;
}
