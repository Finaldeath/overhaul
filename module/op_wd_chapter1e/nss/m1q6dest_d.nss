#include "NW_I0_Generic"
void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 600:
        {
            ActionCastSpellAtObject(SPELL_MAGIC_VESTMENT,OBJECT_SELF);
        }
        break;
        case 690:
        {
            ClearAllActions();
            DetermineCombatRound();
        }
        break;
        case 699:
        {
            if(TalentAdvancedBuff(20.0))
            {
                return;
            }
        }
        break;
        case 1001:
        {
            if(GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                                    PLAYER_CHAR_IS_PC,
                                                    OBJECT_SELF,
                                                    1,
                                                    CREATURE_TYPE_PERCEPTION,
                                                    PERCEPTION_SEEN)) &&
                 GetLocalInt(OBJECT_SELF,"NW_L_Surrender") < 1)
            {
                int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");
                if(nCount == 0)
                {
                    SpeakOneLinerConversation();
                    nCount ++;
                }
                else if(nCount >= 3)
                {
                    nCount = 0;
                }
                SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
            }
        }
        break;
        case 1003:
        {
            int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");
            if(nCount == 0)
            {
                SpeakOneLinerConversation();
                nCount ++;
            }
            else if(nCount >= 3)
            {
                nCount = 0;
            }
            SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
        }
    }
}

