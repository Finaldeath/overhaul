// Tymofarrar knows that the PC was sent by J'nah to kill him

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Jnah_Talk") == 2;
    return iResult;
}
