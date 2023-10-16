///Player on Catapult quest, quest not over(Damas' Talk level at 0)

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Catapults") ==1 &&
    GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 0;

    return iResult;
}
