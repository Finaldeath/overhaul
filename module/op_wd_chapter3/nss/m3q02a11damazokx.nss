///Player on Zokan quest, quest not over(Damas' Talk level at 2)

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Zokan") ==1 &&
    GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 2;

    return iResult;
}

