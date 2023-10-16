// Area user defined events

void BringGolems(string sGolemBP, object oWP1, object oWP2)
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP1));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP2));
    CreateObject(OBJECT_TYPE_CREATURE, sGolemBP, GetLocation(oWP1));
    CreateObject(OBJECT_TYPE_CREATURE, sGolemBP, GetLocation(oWP2));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // Bring Aghaaz golems
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BRING_GOLEMS_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_BRING_GOLEMS_ONCE", 1);

        object oWP1 = GetWaypointByTag("q4c_wp_aghaaz_golems_sp1");
        object oWP2 = GetWaypointByTag("q4c_wp_aghaaz_golems_sp2");
        BringGolems("q4b_ston_golem2", oWP1, oWP2);

    }
    else if(nEvent == 102) // Bring rebel golems
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BRING_GOLEMS_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_BRING_GOLEMS_ONCE", 1);

        object oWP1 = GetWaypointByTag("q4c_wp_rebel_golems_sp1");
        object oWP2 = GetWaypointByTag("q4c_wp_rebel_golems_sp2");
        BringGolems("goldgolem001", oWP1, oWP2);
    }
    else if(nEvent == 103) // kill golems (power source taken or destroyed)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KILL_ALL_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_KILL_ALL_ONCE", 1);

        AddJournalQuestEntry("q2_maker", 100, GetFirstPC());

          effect eDeath = EffectDeath();

            object oCreature = GetFirstObjectInArea(OBJECT_SELF);
            while(oCreature != OBJECT_INVALID)
            {
                if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE && ! GetIsDead(oCreature))
                {
                    if(GetRacialType(oCreature) == RACIAL_TYPE_CONSTRUCT)
                    {
                        AssignCommand(oCreature, SetIsDestroyable(FALSE, FALSE, FALSE));
                        if(GetStringLeft(GetTag(oCreature), 3) == "q4c")
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oCreature);
                    }
                }
                if(GetObjectType(oCreature) == OBJECT_TYPE_ENCOUNTER)
                    DestroyObject(oCreature);
                oCreature = GetNextObjectInArea(OBJECT_SELF);
            }
     }
}
