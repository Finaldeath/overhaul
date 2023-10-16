// kill the dying worker

void main()
{
    //effect eDamage = EffectDamage(3);
    SetPlotFlag(OBJECT_SELF, FALSE);
    effect eDeath = EffectDeath();
    object oWorker = GetNearestObjectByTag("Q3A_WORKER");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oWorker);
}
