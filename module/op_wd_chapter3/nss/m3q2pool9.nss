// * other pool pressed red

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetNearestObjectByTag("M3Q2LampPRIM"), "NW_G_M2_GEMPRESSED") == 1;
    return iResult;
}


