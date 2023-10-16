// if the PC doesn't know that these are the kobolds that attacked Hilltop

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Kobold_Raid") == 0;
    return iResult;
}
