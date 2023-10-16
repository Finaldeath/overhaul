//sg1_fatherlove
//Mark that the PC said somthing needy about his father

void main()
{
    object oPC = GetPCSpeaker();
    int iFatherLove = GetLocalInt(oPC, "SG1_LOVE_FATHER");

    //increment the daddy love'o'meter.
    SetLocalInt(oPC, "SG1_LOVE_FATHER", iFatherLove + 1);
}
