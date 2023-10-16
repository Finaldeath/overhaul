int StartingConditional()
{
    object oWinner = GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC");
    int iPlot = GetLocalInt(OBJECT_SELF,"Mutamin_Contest_Mentioned");
    if ((oWinner == GetPCSpeaker()) && (iPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
