//Set that the PC knows about the Isle of the Maker
//act_q2gulhrys_1
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_PCKnowsIsleOfTheMaker", 1);
}
