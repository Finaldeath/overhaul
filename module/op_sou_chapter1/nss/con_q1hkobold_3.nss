int StartingConditional()
{
    object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    if (GetLocalInt(oDialog, "nTalkedOnce") != 1 && GetLocalInt(oKobold, "nTalkedOnce")!=1)
        return TRUE;
    return FALSE;
}
