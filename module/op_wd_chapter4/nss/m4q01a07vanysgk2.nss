/////// Check if PC offered to help Trancar, check if Vanya still available for hiring

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALK_TRANCAR") ==3 &&
              GetLocalInt(GetModule(), "NW_G_M4Q01TRANCAR_HENCH") ==0;
    return iResult;
}
