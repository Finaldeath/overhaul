int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1;
    return iResult;
}
