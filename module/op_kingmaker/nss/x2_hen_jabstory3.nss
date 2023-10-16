// Jab's story on third level

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(GetModule(), "x2_hen_jabstory") == 2
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=20;
    return iResult;
}
