//Give the PC speaker 10 gold
//act_q1_give10gp
void main()
{
    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC, 10);
}
