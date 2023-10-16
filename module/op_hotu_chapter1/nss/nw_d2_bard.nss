//NW_D2_BARD
//
// checks to see if the PC has any levels of Bard

int StartingConditional()
{
    int nClass = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());
    if (nClass > 0)
    {
        return TRUE;
    }
    return FALSE;
}
