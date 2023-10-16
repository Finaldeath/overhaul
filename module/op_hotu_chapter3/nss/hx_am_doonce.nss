// Check the amulet's state (DoOnce).
int StartingConditional()
{
    int bDoOnce = GetLocalInt(GetModule(), "HX_SENSEI_AMULET_DO_ONCE");
    int bPowersKnown = GetLocalInt(GetModule(), "HX_SENSAI_AMULET");
    if (bDoOnce == FALSE &&
        bPowersKnown == TRUE)
    {
        SetLocalInt(GetModule(), "HX_SENSEI_AMULET_DO_ONCE", TRUE);
        return TRUE;
    }
    return FALSE;
}

