// once player has finished Baram's plot

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Baram") == 4;
    return iResult;
}
