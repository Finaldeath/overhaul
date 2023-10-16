// the player has spoken to Kurth previously

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Talked_To_Kurth") == 1;
    return iResult;
}
