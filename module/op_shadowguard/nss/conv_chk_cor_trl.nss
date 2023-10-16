int StartingConditional()
{
    object o = GetPCSpeaker();

    string sCurrTrial = GetLocalString(o, "S_COR_CURR_TRIAL");

    if (GetLocalInt(o, "N_" + sCurrTrial) == 1)
        return TRUE;

    return FALSE;
}
