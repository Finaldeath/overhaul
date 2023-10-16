///// Check if PC already talke to

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(), "NW_L_Snow_Drag") ==0;
    return iResult;
}
