int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(GetModule(),"nw_g_m1q1_Giles")==40)
    {
        return TRUE;
    }
    return FALSE;
}


