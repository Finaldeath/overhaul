// * gem is blue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_G_M2_GEMPRESSED") == 3;
    return iResult;
}
