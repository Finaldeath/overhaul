// the PC talked specifically to Tomi

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Tomi") == 1;
    return iResult;
}
