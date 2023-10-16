int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"FIND_SPIRIT"+GetTag(OBJECT_SELF));
    if (iResult == 99)
    {
        return TRUE;
    }
    return FALSE;
}
