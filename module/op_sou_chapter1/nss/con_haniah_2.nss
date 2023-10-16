//The mayor is dead
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 80
        && GetIsObjectValid(GetObjectByTag("Szaren")))
        return TRUE;
    return FALSE;
}
