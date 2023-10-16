// if the player has not asked Torias about his 'store'

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_Torias_Store") == 0;
    return iResult;
}
