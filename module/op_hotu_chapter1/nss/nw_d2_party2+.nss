// NW_D2_PARTY2+
//
// If there is currently more than one PC party member

int StartingConditional()
{
    object oFirst = GetFirstPC();
    object oSecond = GetNextPC();
    if (GetIsObjectValid(oSecond))
    {
        return TRUE;
    }
    return FALSE;
}
