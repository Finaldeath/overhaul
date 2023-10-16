void GiveRPXPToPC(object oPC, int nAmount)
{
    SendMessageToPC(oPC, "You have roleplayed your character...");
    GiveXPToCreature(oPC, nAmount);
}
