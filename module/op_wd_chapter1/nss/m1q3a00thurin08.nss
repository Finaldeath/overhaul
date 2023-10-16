int StartingConditional()
{
    object oMeldanen = GetObjectByTag("MeldanenM1Q3");
    if (GetIsObjectValid(oMeldanen))
    {
        return TRUE;
    }
    return FALSE;
}
