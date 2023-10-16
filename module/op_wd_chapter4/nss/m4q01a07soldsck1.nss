////Check if Golems still active

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 1 &&
              GetLocalInt(GetModule(), "NW_G_M4Q01_GOLEMS") < 2;
    return iResult;
}
