int StartingConditional()
{
    int iResult;

    iResult = GetHenchman(GetPCSpeaker()) != OBJECT_SELF;
    return iResult;
}
