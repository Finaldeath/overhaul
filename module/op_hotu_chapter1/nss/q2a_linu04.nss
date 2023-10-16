// the PC never talked specifically to Linu
// and did not talk to the adventurers

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetPCSpeaker(), "pre_Talked_Linu") == 0) &&
              (GetLocalInt(GetModule(), "PRE_SPOKE_ADVENTURERS") == 0));
    return iResult;
}


