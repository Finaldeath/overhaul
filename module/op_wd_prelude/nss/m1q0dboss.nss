void MakeAttack()
{
    int nNth = 1;
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                        REPUTATION_TYPE_ENEMY,
                                        OBJECT_SELF,
                                        nNth,
                                        CREATURE_TYPE_PERCEPTION,
                                        PERCEPTION_SEEN,
                                        CREATURE_TYPE_PLAYER_CHAR,
                                        PLAYER_CHAR_NOT_PC);



    if(GetIsObjectValid(oTarget))
    {
        talent tAttack = GetCreatureTalentRandom(TALENT_CATEGORY_HARMFUL_RANGED);
        if(GetIsTalentValid(tAttack))
        {
            ClearAllActions();
            ActionUseTalentOnObject(tAttack,oTarget);
        }
        else
        {
            ActionAttack(oTarget);
        }

    }
}
void main()
{
   if(Random(6) == 0)
   {
        SpeakOneLinerConversation();
   }
   MakeAttack();
}


