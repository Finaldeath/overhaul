// check to see if the PC has never been told of J'Nah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Know_Jnah") == 0;
    return iResult;
}
