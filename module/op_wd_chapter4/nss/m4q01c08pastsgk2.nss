////Check if Ravens checked on (spoken to Wilbur)

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_RAVENCHECK") ==1;

    return iResult;
}

