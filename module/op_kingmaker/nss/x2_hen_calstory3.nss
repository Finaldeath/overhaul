// Cal's story on third level

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "x2_hen_calstory") == 2
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=20;

    return iResult;
}
