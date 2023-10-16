void ShoutDisturbed(object oDisturber)
{
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE);
    object oMaster = GetMaster(oDisturber);

    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget) == TRUE)
    {
       if (GetFactionEqual(oTarget, OBJECT_SELF) == TRUE)
       {
           // * Make anyone who is a member of my faction hostile if I am violated
           SetIsTemporaryEnemy(oDisturber, oTarget);
           SetIsTemporaryEnemy(oMaster, oTarget);
           AssignCommand(oTarget, ActionAttack(oDisturber));
       }

       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE);
    }
}

void main()
{
    object oKiller = GetLastKiller();
    object oDamager = GetLastDamager();
    object oAttacker = GetLastAttacker();
    object oCaster= GetLastSpellCaster();
    object oDisturber = GetLastDisturbed();
    object oOpener = GetLastOpenedBy();

    if (oKiller != OBJECT_INVALID)
        ShoutDisturbed(oKiller);
    else if (oDamager != OBJECT_INVALID)
        ShoutDisturbed(oDamager);
    else if (oAttacker != OBJECT_INVALID)
        ShoutDisturbed(oAttacker);
    else if (oCaster != OBJECT_INVALID)
        ShoutDisturbed(oCaster);
    else if (oDisturber != OBJECT_INVALID)
        ShoutDisturbed(oDisturber);
    else if (oOpener != OBJECT_INVALID)
        ShoutDisturbed(oOpener);

}
