const int LAWFUL = 1;
const int NEUTRAL = 2;
const int CHAOTIC = 3;

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_COR_MEM_OKAR_DECISION", LAWFUL);
}
