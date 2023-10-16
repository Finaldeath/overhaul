////Check if catapults still active

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") > 0 &&
              GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") < 2;

    return iResult;
}

