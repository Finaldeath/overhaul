int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Bela_Asked_Captains") == 0;
    return iResult;
}
