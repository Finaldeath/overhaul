int StartingConditional()
{
    object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    if (GetLocalInt(oDialog, "nSnatchSucceed") == 1 || GetLocalInt(oKobold, "nSnatchSucceed") == 1)
        return TRUE;
    return FALSE;
}
