// * other pool pressed blue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetNearestObjectByTag("M3Q2LampPRIM"), "NW_G_M2_GEMPRESSED") == 3;
    return iResult;
}

