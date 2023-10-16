//sg1_fatherneut
//Mark that the PC said somthing neutral about his father

void main()
{
    object oPC = GetPCSpeaker();
    int iFatherNeut = GetLocalInt(oPC, "SG1_NEUT_FATHER");

    //increment the daddy neutral'o'meter.
    SetLocalInt(oPC, "SG1_NEUT_FATHER", iFatherNeut + 1);
}
