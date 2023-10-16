//act_q2aherald_8
//if the PC has enlisted  the Golems help in the battle,
//and has now placed them with the Seer.


void main()
{
    SetLocalInt(OBJECT_SELF, "nGolemsPlaced", 1);

    SetLocalInt(GetModule(), "X2_Battle2GolemsWithSeer", 1);
}
