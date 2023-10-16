// * the rotate the globe option only appears
// * if the globe is empty
int StartingConditional()
{
    int iResult;

    iResult =GetLocalInt(GetModule(), "NW_G_GLOBE_IN_USE") == 0;
    return iResult;
}
