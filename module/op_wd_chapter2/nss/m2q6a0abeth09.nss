int StartingConditional()
{
    int iMeter = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if (iMeter > 0)
    {
        object oRomance = GetLocalObject(OBJECT_SELF,"Chapter2_Aribeth_Romance");
        if ((GetIsObjectValid(oRomance)) && (oRomance == GetPCSpeaker()))
        {
            return TRUE;
        }
    }
    return FALSE;
}
