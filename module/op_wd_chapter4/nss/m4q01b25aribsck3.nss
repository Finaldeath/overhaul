//////Check if Aribeth's feelings have been discussed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01ARIBETH_LOVE_TALK") ==1;
    return iResult;
}
