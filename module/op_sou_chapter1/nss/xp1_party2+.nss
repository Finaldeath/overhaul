// checks to see if there are other PC's besides the speaker

int StartingConditional()
{
    object oFirst = GetFirstPC();
    string sName = GetName(oFirst);
    if (sName != (GetName(GetPCSpeaker())))
    {
        return TRUE;
    }
    else
    {
        object oSecond = GetNextPC();
        if (GetIsObjectValid(oSecond))
        {
            return TRUE;
        }
    }
    return FALSE;
}
