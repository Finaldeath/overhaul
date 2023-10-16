///Player on Subchief quest, quest not over(Damas' Talk level at 1)

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Subchief") ==1 &&
    GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1;

    return iResult;
}

