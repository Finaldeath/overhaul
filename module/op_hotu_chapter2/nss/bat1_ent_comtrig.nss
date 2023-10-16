//Have the bodyguards attack any entering hostiles..
//bat1_ent_comtrig
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    object oGuard1 = GetObjectByTag("q2a_bat1_guard1");
    if (GetIsObjectValid(oGuard1) == TRUE)
    {
        AssignCommand(oGuard1, ActionAttack(oPC));
    }

    object oGuard2 = GetObjectByTag("q2a_bat1_guard1");
    if (GetIsObjectValid(oGuard2) == TRUE)
    {
        AssignCommand(oGuard2, ActionAttack(oPC));
    }

    object oGuard3 = GetObjectByTag("q2a_bat1_guard1");
    if (GetIsObjectValid(oGuard3) == TRUE)
    {
        AssignCommand(oGuard3, ActionAttack(oPC));
    }

    object oGuard4 = GetObjectByTag("q2a_bat1_guard1");
    if (GetIsObjectValid(oGuard4) == TRUE)
    {
        AssignCommand(oGuard4, ActionAttack(oPC));
    }
}
