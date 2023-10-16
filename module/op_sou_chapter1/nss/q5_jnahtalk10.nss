// the PC has met J'Nah OR just heard of her

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetModule(), "X1_JNAH_STATUS") > 0) ||
               (GetLocalInt(GetPCSpeaker(), "Know_Jnah") == 1));
    return iResult;
}
