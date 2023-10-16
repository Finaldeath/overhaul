/// Check if any PC received Words from Lord Nasher

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetLocalObject(OBJECT_SELF,"M4Q01CWORD_PC"));
    return iResult;
}

