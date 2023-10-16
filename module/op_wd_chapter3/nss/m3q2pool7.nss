// * other pool pressed yellow

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetNearestObjectByTag("M3Q2LampPRIM"), "NW_G_M2_GEMPRESSED") == 2;
    return iResult;
}
