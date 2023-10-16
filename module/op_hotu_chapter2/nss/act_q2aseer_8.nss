//act_q2aseer_8
//Set a variable for the save/load bug

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad",1);
}
