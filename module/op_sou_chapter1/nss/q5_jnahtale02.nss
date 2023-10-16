// Tymofarrar has never told the tale of Jnah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Told_Jnah_Tale") == 0;
    return iResult;
}
