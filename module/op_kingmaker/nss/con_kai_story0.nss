// Kaidala's story has not yet started

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_KAI_STORY") == 0;
    return iResult;
}
