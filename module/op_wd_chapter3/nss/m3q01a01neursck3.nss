/////// Threatened Neurik, Neurik hates PC

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NEURIK_HATE") ==1;
    return iResult;
}

