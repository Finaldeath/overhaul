/// Check if PC brought Haedraline the final word of Power

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"M4Q01CWORD_PC") == GetPCSpeaker();
    return iResult;
}
