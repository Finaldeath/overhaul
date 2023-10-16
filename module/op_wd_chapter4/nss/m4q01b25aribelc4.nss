//// Check if she has already said her opening lines

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 1;
    return iResult;
}
