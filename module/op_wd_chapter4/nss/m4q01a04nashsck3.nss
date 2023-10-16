///////////
/// Checks if Player has spoken to Haedraline
//////////

    #include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01_HAEDRALINE_TALKEDTO") >= 2
               && CheckIntelligenceLow();
    return iResult;
}

