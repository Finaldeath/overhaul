//NW_D2_ROGUE
//
// checks to see if the PC has any levels of Rogue

int StartingConditional()
{
    int nClass = GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker());
    if (nClass > 0)
    {
        return TRUE;
    }
    return FALSE;
}
