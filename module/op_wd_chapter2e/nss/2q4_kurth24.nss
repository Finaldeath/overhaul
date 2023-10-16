// if the player has agreed to kill Baram

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") == 1;
    return iResult;
}
