int StartingConditional()
{
    string s = "CUNNING";

    object o = GetPCSpeaker();

    string sCurrTrial = GetLocalString(o, "S_COR_CURR_TRIAL");

    if (s == sCurrTrial)
        return TRUE;

    return FALSE;
}
