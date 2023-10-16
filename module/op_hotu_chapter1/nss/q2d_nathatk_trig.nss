//q2d_nathatk_trig
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;


    object oNathyrra = GetObjectByTag("x2_hen_nathyrra");
    if (GetIsObjectValid(GetMaster(oNathyrra)) == TRUE)
        return;

    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY, oNathyrra);


    AssignCommand(oNathyrra, ActionAttack(oEnemy));
}
