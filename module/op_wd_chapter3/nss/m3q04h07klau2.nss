// * Klauth was given the bad orb
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_L_BETRAYED") ==1;
    return iResult;
}
