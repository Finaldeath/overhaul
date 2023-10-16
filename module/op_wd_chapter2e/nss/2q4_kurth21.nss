int StartingConditional()
{
    int iResult;

    iResult = (GetLocalInt(GetPCSpeaker(),"Working_For_Baram") != 1) && (GetLocalInt(GetPCSpeaker(),"Working_For_Baram") != 2);
    return iResult;
}
