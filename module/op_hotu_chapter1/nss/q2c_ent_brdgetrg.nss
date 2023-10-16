// q2c_ent_brdgetrg
//Get the two drow at the door to attack the PC
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", GetLocalInt(OBJECT_SELF, "nTriggered") + 1);

    object oDrow1 = GetObjectByTag("cut39_drow1");

    object oDrow3 = GetObjectByTag("cut39_drow3");

    AssignCommand(oDrow1, ActionAttack(oPC));
    AssignCommand(oDrow3, ActionAttack(oPC));
}
