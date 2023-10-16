// checks to see if the PC has heard of J'Nah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Know_Jnah") == 1;
    return iResult;
}
