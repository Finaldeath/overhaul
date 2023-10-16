int StartingConditional()
{
    object oAmbass = GetLocalObject(OBJECT_SELF,"Ambassador");
    int iPlot = GetLocalInt(GetModule(),"Host_Tower_Bridge_Open");
    if ((oAmbass == GetPCSpeaker()) && (iPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
