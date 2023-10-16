// * other pool had any color pressed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetNearestObjectByTag("M3Q2LampPRIM"), "NW_G_M2_GEMPRESSED") >0;
    return iResult;
}



