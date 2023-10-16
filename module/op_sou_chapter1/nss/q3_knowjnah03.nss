// the PC knows that Jnah wants the artifacts

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Jnah_Artifacts") == 1;
    return iResult;
}
