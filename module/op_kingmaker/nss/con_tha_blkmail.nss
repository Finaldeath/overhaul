int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iResult = FALSE;

    if ((GetLocalInt(GetModule(), "OS_KILLGELANI") < 10)
    && (GetLocalInt(GetModule(),"OS_KILLTYPHUS")==20))
    {
        iResult = TRUE;
    }

    return iResult;
}
