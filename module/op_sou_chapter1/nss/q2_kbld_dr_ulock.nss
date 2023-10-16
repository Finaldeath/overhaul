// set the kobold status to show that the player handled the door himself

void main()
{
    object oPC = GetLastUnlocked();
    if(!GetIsPC(oPC))
        return;
    object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");
    SetLocalInt(oKobold, "Q2_KOBOLD_DOOR_PASSED", 1);
}
