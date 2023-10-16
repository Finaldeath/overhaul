void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oWP = GetNearestObjectByTag("WP_COR_TRIAL", oPC);

        string sName = GetName(oWP);

        SetLocalString(oPC, "S_COR_CURR_TRIAL", sName);
    }
}
