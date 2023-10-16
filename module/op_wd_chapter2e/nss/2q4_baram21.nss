int StartingConditional()
{
    int iResult;

    iResult = (GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") != 1) && (GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") != 2);
    return iResult;
}
