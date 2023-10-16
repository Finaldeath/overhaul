int StartingConditional()
{

    if (GetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE") == 1)
        return TRUE;
    return FALSE;
}
