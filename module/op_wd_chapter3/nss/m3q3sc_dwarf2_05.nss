/////Already Talked to Hodd, Dwarves not hostile

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10
            && GetLocalInt(GetPCSpeaker(), "NW_L_Hodd_Talk") ==1;
    return iResult;
}


