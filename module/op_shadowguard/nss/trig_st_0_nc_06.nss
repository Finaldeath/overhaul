void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SetLocalInt(oPC, "N_ST_0_PH_PERC_SWITCH", 1);
    }
}
