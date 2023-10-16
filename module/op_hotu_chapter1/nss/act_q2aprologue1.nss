//Set variable on the PC to show he's through this initial conversation
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2A1Prologue", 1);
}
