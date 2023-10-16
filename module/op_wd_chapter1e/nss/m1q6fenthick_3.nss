///////////////////////////////////////////////////////////////////////////////
//:: Default End of Combat round
//::
//:: NW_C2_Default3.nss
//::
//:: Copyright (c) 2000 Bioware Corp.
///////////////////////////////////////////////////////////////////////////////
/*   Every round of combat, this script will cheack to see if the last
    opponent is still available.  If not, it will check for a new opponent.
*/
///////////////////////////////////////////////////////////////////////////////
//:: Created By: Aidan Scanlan   On: Sept 4, 2001
//:: Modified By Aidan on Oct 2001
///////////////////////////////////////////////////////////////////////////////
object FindTarget(float fMaxDistance);
int DecideSpell(int nOffensive);
void main()
{
    SpeakString("Start",TALKVOLUME_SHOUT);
    int nSpell = -1;
    float fFollowDistance = 10.0f;
    object oTarget = GetAttackTarget();
    if(  GetIsObjectValid(oTarget) &&
         GetDistanceToObject(oTarget) < fFollowDistance &&
         !GetIsDead(oTarget) &&
         GetIsEnemy(oTarget) )
    {
        if(d2() == 1)
        {
            ActionAttack(oTarget);
        }
        else
        {
            if(nSpell != -1)
            {
                ActionCastSpellAtObject(nSpell,oTarget);
            }
            else
            {
                ActionAttack(oTarget);
            }
        }
    }
    else
    {
        oTarget = FindTarget(fFollowDistance);
        if(  GetIsObjectValid(oTarget) )
        {
            ClearAllActions();
            ActionAttack(oTarget);
        }
        else
        {
            //Cast Prep spell
            nSpell = DecideSpell(FALSE);
            if(nSpell != -1)
            {
                ActionCastSpellAtObject(nSpell,OBJECT_SELF);
            }
            else
            {
                ClearAllActions();
            }
        }
    }
}

///////////////////////////////////////////////////////////////////////////////
//  FindTarget
///////////////////////////////////////////////////////////////////////////////
/* This function will return the nearest viable Target within the given range
   If none are available, it will return OBJECT_INVALID
*/
///////////////////////////////////////////////////////////////////////////////
//  Created By: Aidan Scanlan  On:
///////////////////////////////////////////////////////////////////////////////


object FindTarget(float fMaxDistance)
{
    int nNth = 1;
    int bFoundTarget = FALSE;
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY,OBJECT_SELF,nNth);
    while ( !bFoundTarget && GetIsObjectValid(oTarget) && GetDistanceToObject(oTarget) < fMaxDistance)
    {
        if( !GetIsDead(oTarget) &&
            GetIsEnemy(oTarget)  )
        {
            bFoundTarget = TRUE;
        }
        else
        {
            nNth++;
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY,OBJECT_SELF,nNth);
        }
    }
    return oTarget;
}

int DecideSpell(int nOffensive)
{
    int nSpellToCast = -1;

    int nIndex;
    if (nOffensive)
    {
        nIndex = GetLocalInt(OBJECT_SELF,"NW_L_OffensiveSpellsCast");
        switch(nIndex)
        {
            case 1: nSpellToCast = SPELL_PRAYER ; break;
            case 2: nSpellToCast = SPELL_BULLS_STRENGTH; break;
            case 3: nSpellToCast = SPELL_AID; break;
            case 4: nSpellToCast = SPELL_REMOVE_FEAR; break;
        }
        SetLocalInt(OBJECT_SELF,"NW_L_OffensiveSpellsCast",nIndex+1);
    }
    else
    {
        nIndex = GetLocalInt(OBJECT_SELF,"NW_L_DefensiveSpellsCast");
                switch(nIndex)
        {
            case 1: nSpellToCast = SPELL_DISPEL_MAGIC; break;
            case 2: nSpellToCast = SPELL_BESTOW_CURSE; break;
            case 3: nSpellToCast = SPELL_SOUND_BURST; break;
            case 4: nSpellToCast = SPELL_HOLD_PERSON; break;
        }
        SetLocalInt(OBJECT_SELF,"NW_L_DefensiveSpellsCast",nIndex+1);
    }

    return nSpellToCast;
}
