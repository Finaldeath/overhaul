//act_q2aherald_7
//if the PC has enlisted  the Deva's help in the battle,
//and has now placed her with the Seer.


void main()
{
    SetLocalInt(OBJECT_SELF, "nDevaPlaced", 1);

    SetLocalInt(GetModule(), "X2_Battle2DevaWithSeer", 1);

}
