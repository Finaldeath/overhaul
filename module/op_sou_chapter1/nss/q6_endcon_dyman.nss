//Gnolls attack and kill the dying man
void main()
{
    SetCommandable(FALSE);
    object oMan = GetObjectByTag("dyingman");

    location lSpawn = GetLocation(GetWaypointByTag("wp_q6_gnollattacker"));
    object oGnoll1 = CreateObject(OBJECT_TYPE_CREATURE, "q6gnollarcher", lSpawn);
    object oGnoll2 = CreateObject(OBJECT_TYPE_CREATURE, "q6gnollarcher", lSpawn);

    AssignCommand(oGnoll1, ActionAttack(oMan));
    AssignCommand(oGnoll2, ActionAttack(oMan));
    effect eDeath = EffectDeath(TRUE);

    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oMan));

}
