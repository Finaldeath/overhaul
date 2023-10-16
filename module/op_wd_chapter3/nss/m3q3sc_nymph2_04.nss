////// Check if PC is a dwarf

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1 &&
              GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_DWARF;


    return iResult;
}


