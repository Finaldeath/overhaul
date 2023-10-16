// if the player has pissed off Baram

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Baram") == 3;
    return iResult;
}

