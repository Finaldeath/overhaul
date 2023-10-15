void main()
{
    int nNth = 1;
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                        REPUTATION_TYPE_ENEMY,
                                        OBJECT_SELF,
                                        nNth,
                                        CREATURE_TYPE_PERCEPTION,
                                        PERCEPTION_SEEN);
    while(GetIsObjectValid(oTarget) && GetIsPC(oTarget) == FALSE)
    {
        nNth++;
        oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                     REPUTATION_TYPE_ENEMY,
                                     OBJECT_SELF,
                                     nNth,
                                     CREATURE_TYPE_PERCEPTION,
                                     PERCEPTION_SEEN);
    }

    if(GetIsObjectValid(oTarget))
    {
        talent tAttack = GetCreatureTalentRandom(TALENT_CATEGORY_HARMFUL_RANGED);
        if(GetIsTalentValid(tAttack))
        {
            ActionUseTalentOnObject(tAttack,oTarget);
        }
        else
        {
            ActionAttack(oTarget);
        }

    }
}
