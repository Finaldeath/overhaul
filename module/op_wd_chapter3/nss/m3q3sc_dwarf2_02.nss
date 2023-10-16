// * random battle cry

int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10;

    if (Random(100) < 66)
    {
        iResult = FALSE;
    }
    return iResult;
}

