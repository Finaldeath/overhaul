// the PC has mentioned J'Nah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Jnah_Talk") == 1;
    return iResult;
}
