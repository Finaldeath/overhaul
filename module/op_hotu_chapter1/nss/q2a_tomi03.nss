// the PC never talked specifically to Tomi
// but did talk to the adventurers

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetPCSpeaker(), "pre_Talked_Tomi") == 0) &&
              (GetLocalInt(GetModule(), "PRE_SPOKE_ADVENTURERS") == 1));
    return iResult;
}
