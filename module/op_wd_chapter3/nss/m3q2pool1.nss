// * This pool is red
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_G_M2_GEMPRESSED") == 1;
    return iResult;
}
