void main()
{
    object oRespawner = GetLastRespawnButtonPresser();
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);
    object oSpawnPoint = GetObjectByTag("NW_DEATH_TEMPLE");
    string sArea = GetTag(GetArea(oRespawner));
    if (GetIsObjectValid(oSpawnPoint) &&
        (sArea == "M0Q1D" ||
         sArea == "M0Q1E") )
    {
        AssignCommand(oRespawner,ClearAllActions());
        AssignCommand(oRespawner,JumpToLocation(GetLocation(oSpawnPoint)));
    }

 }
