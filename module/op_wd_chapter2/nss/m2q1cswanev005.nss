int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_StoleFromWanev") == 10;
    return iResult;
}
