//Return true if anyone has tried to snatch the baby before...
int StartingConditional()
{
    object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    if (GetLocalInt(oDialog, "nSnatchAttempt") != 1 && GetLocalInt(oKobold, "nSnatchAttempt") != 1)
        return TRUE;
    return FALSE;
}
