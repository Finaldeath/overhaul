// the PC does not know that Tymo has the mask

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5_Know_Tymo_Mask") == 0;
    return iResult;
}
