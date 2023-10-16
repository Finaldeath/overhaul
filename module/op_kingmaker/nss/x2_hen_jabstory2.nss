// Jab's story on second level

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "x2_hen_jabstory") == 1
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=10;
    return iResult;
}
