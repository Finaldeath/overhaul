/// Check if PC received Words from Lord Nasher

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"M4Q01CWORD_PC") == GetPCSpeaker();
    return iResult;
}

