// * gem is  yellow
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_G_M2_GEMPRESSED") == 2;
    return iResult;
}
