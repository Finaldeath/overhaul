///////////////////////////////////////////////
//:: q2b_ud_ogremage
//:: Surrender User Defined
//:: SURRENDER_UDEF
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions

    OGRE MAGE
    When he is fairly wounded -- but not enough to surrender --
    he should drink a potion of invisibility and a string shoudl appear,
    "Ogre magic goes invisible!". He should fully heal himself at this point
    (just cheat heal him, player will assume he went invisible and drank potions.
    Move him to a better strategic position in the room and
    uses his Wand of Lightning at the players and goes visible.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 16, 2001
//:://////////////////////////////////////////////
//:: May 2002: Don't surrender if dead

#include "nw_i0_plot"
#include "x2_inc_plot"
#include "x2_inc_banter"

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
//            ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    //On Damaged
    if(nUser == 1006)
    {
        if (GetLocalInt(OBJECT_SELF, "Generic_Surrender") == 1)
        {
            ClearAllActions(TRUE);
            return;
        }

        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once
        if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= 70) && GetLocalInt(OBJECT_SELF,"InvisHealOnce") == 0)
        {
            SetLocalInt(OBJECT_SELF, "InvisHealOnce",1);
            ClearAllActions(TRUE);
            ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(OBJECT_SELF));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectInvisibility(INVISIBILITY_TYPE_IMPROVED), OBJECT_SELF, 12.0));
            object oTarget = GetWaypointByTag("wp_q2b_ogremage_invisjump");
            DelayCommand(1.0, JumpToObject(oTarget));
            int nHeal = GetMaxHitPoints() - GetCurrentHitPoints();
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), OBJECT_SELF));
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            DelayCommand(7.0, ActionCastSpellAtObject(SPELL_ISAACS_LESSER_MISSILE_STORM, oPC, METAMAGIC_ANY, TRUE));
        }
        else if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= 30) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            //Get rid of any summoned creatures
            object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED);
            if (GetIsObjectValid(oSummoned) == TRUE)
            {
                effect eUnsummon = EffectVisualEffect(VFX_IMP_UNSUMMON);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(oSummoned));
                DestroyObject(oSummoned);
            }
            //Make sure there are no effects (like invis) still on the ogre mage
            effect eEffect = GetFirstEffect(OBJECT_SELF);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(OBJECT_SELF, eEffect);
                eEffect = GetNextEffect(OBJECT_SELF);
            }

            SurrenderToEnemies();
            ClearAllActions();
            SpeakOneLinerConversation();
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            Reward_2daXP(oPC, XP_HIGH, TRUE);

            ActionMoveToObject(oPC);

            //HENCHMAN INTERJECTION
            AttemptInterjectionOrPopup(OBJECT_SELF, "x2_oneliner_nr", oPC, 8);
            SetImmortal(OBJECT_SELF, FALSE);

        }
    }
    else if (nUser == 1007)  // On death
    {
        SetLocalInt(GetModule(),"OgreMage",20);  // Variable for the fairy queens conversation
    }
}



