// the player has spoken to Baram previously

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Talked_To_Baram") == 1;
    return iResult;
}
