int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1
            && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES"));
    return iResult;
}
