//// Checks if Luce and her sister Leesa have been reunited
// * May 2002: Or if Leesa is in the room

int StartingConditional()
{
    int iResult = FALSE;
    if (GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE")==2 ||
              GetIsObjectValid(GetNearestObjectByTag("M4Q01B08LEES")) == TRUE)
    {
        iResult = TRUE;
    }
    return iResult;
}
