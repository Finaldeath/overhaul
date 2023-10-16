int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    object oRomance = GetLocalObject(OBJECT_SELF,"Chapter2_Aribeth_Romance");
    if ((iPlot > 1) && ((oRomance != GetPCSpeaker()) || (!GetIsObjectValid(oRomance))))
    {
        return TRUE;
    }
    return FALSE;
}
