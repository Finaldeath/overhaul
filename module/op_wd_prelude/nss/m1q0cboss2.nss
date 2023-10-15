void MakeAttack()
{
    int nNth = 1;
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                        REPUTATION_TYPE_ENEMY,
                                        OBJECT_SELF,
                                        nNth,
                                        CREATURE_TYPE_PERCEPTION,
                                        PERCEPTION_SEEN);
    while(GetIsObjectValid(oTarget) && GetIsPC(oTarget))
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

#include "NW_I0_GENERIC"

void main()
{
    //This is the equivalent of a force conversation bubble, should only be used if you want an NPC
    //to say something while he is already engaged in combat.
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION) && GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SpeakOneLinerConversation();
    }
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
                SetFacingPoint(GetPosition(GetLastPerceived()));
                SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                MakeAttack();
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention

        }
    }
    //If the last perception event was hearing based or if someone vanished then go to search mode
    else if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        //if(!TalentSeeInvisible())
        //{
            object oGone = GetLastPerceived();
            if(GetAttemptedAttackTarget() == GetLastPerceived() || GetAttemptedSpellTarget() == GetLastPerceived())
            {
                MakeAttack();
                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
                {
                    ActionMoveToLocation(GetLocation(oGone), TRUE);
                }
            }
        //}
    }
}
