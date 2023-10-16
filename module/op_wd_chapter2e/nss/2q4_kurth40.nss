// if the player has pissed off Kurth

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") == 3;
    return iResult;
}
