// * returns true if the player has opened the Sourcestone.
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_SOURCESTONEISOPEN") == 10;
    return iResult;
}
