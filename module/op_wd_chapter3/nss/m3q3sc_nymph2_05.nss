/////Already Talked to Arwyl, Nymphs not hostile

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1
            && GetLocalInt(GetPCSpeaker(), "NW_L_Arwyl_Talk") ==1;
    return iResult;
}

