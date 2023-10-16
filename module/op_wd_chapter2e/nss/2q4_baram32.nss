// if the player has agreed to kill Kurth, forced Baram to make counter-offer

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Baram") == 2;
    return iResult;
}

