//////Check if Nax already talked to PC once

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_NaxTalk") ==1;
    return iResult;
}
