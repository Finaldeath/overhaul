// one planar object has already been put through the portal

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "PORTAL_DESTROYED") == 1;
    return iResult;
}
