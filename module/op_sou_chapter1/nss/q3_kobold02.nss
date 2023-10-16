// if the PC knows that these are the kobolds that attacked Hilltop

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Kobold_Raid") == 1;
    return iResult;
}
