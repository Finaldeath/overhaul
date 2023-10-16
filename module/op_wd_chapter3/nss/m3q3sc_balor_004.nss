int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"M3Q3TalkedToBalor"+GetTag(OBJECT_SELF)) == 1;
    return iResult;
}

