// if the player has agreed to kill Kurth

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Baram") == 1;
    return iResult;
}
