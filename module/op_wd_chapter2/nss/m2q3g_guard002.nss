int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_TalkedToMobley") == 0;
    return iResult;
}
