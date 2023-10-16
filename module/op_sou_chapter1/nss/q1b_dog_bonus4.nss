// if the PC has been told about Bethsheva's secret

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    int iMod = GetLocalInt(GetModule(), "q1b_Bethsheva_Secret");
    int iPC = GetLocalInt(oPC, "q1b_Bethsheva_Secret");

    if (iPC != 2)
        return TRUE;
    return FALSE;

}
