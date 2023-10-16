// Kaidala's story has been told twice

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_KAI_STORY") == 2
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=20;
    return iResult;
}
