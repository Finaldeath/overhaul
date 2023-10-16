//Attack nearest enemy
//act_q2d2slaveld_4
void main()
{
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    ActionAttack(oTarget);
}
