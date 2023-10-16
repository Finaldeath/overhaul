void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        SetLocalInt(oPC, "N_ST_1_DKBR_CLEAR", 1);
}
