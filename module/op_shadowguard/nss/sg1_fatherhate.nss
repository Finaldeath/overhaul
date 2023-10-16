//sg1_fatherhate
//Mark that the PC said somthing Hateful about his father

void main()
{
    object oPC = GetPCSpeaker();
    int iFatherHate = GetLocalInt(oPC, "SG1_HATE_FATHER");

    //increment the daddy hate'o'meter.
    SetLocalInt(oPC, "SG1_HATE_FATHER", iFatherHate + 1);
}
