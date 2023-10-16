// once player has finished Kurth's plot

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") == 4;
    return iResult;
}
