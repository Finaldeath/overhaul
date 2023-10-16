// if the player has agreed to kill Baram, forced Kurth to make counter-offer

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") == 2;
    return iResult;
}

