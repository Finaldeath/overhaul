// the PC never talked specifically to Tomi

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Tomi") == 0;
    return iResult;
}
