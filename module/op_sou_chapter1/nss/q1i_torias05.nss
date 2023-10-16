// if the player has asked Torias about his 'store'

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_Torias_Store") == 1;
    return iResult;
}
