// Kaidala's story has been told once

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_KAI_STORY") == 1
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=10;
    return iResult;
}
