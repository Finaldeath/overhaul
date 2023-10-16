int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"TalkedTo") ==0;
    return iResult;
}
