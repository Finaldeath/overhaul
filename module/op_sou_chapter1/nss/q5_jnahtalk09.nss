// the PC has heard of Jnah but never met her

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetPCSpeaker(), "Know_Jnah") == 1) &&
              (GetLocalInt(GetModule(), "X1_JNAH_STATUS") == 0));
    return iResult;
}
