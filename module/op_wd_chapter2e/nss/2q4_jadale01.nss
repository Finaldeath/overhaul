// Lady Jadale has not been convinced to give up ring

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Jadale_Convinced") == 0;
    return iResult;
}
