//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2b_ud_nymph
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions
    on Perceive of an enemy - the nymph will start
    turning objects into allies.
    Trees -> flesh golems..
    Pool -> Water elemental
    Butteflies - Faerie Dragon
    Dogs -> Dire Wolves
    Chickens -> Cockatrices
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x2_inc_banter"
#include "nw_i0_plot"
object FindNymphTarget();
void TransformTarget(object oTarget);
void CreateMinion(string szResRef, location lLoc);
void DestroyAllAllies();

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1002) // PERCEIVE
    {

        if (GetLocalInt(OBJECT_SELF,"nDoOnce") ==0)
        {
            object oPC = GetLastPerceived();
            if (GetLastPerceptionSeen() == TRUE && GetIsPC(oPC) == TRUE)
            {
                //SendMessageToPC(GetFirstPC(), "Target Seen : " + GetName(oPC));
                VoiceThreaten();
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectInvisibility(INVISIBILITY_TYPE_IMPROVED), OBJECT_SELF, 120.0);
                SetLocalInt(OBJECT_SELF,"nDoOnce",1);
                object oTarget = FindNymphTarget();
                //SendMessageToPC(GetFirstPC(), "Target : " + GetName(oTarget));
                if (GetIsObjectValid(oTarget) == TRUE)
                {
                    //SendMessageToPC(GetFirstPC(), "Target Valid");
                    TransformTarget(oTarget);
                }

            }
        }
    }
    else if(nUser == 1003) // END OF COMBAT ROUND
    {
        if (GetLocalInt(OBJECT_SELF, "Generic_Surrender") == 1)
            return;

        if (GetIsInCombat() == TRUE)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            //SendMessageToPC(GetFirstPC(), "Name: "+GetName(oPC));
            //SendMessageToPC(GetFirstPC(), "PC?: "+ IntToString(GetIsPC(oPC)));
            if (GetIsEnemy(oPC) == TRUE)
            {
                if (GetDistanceToObject(oPC) > 5.0)
                {
                    object oTarget = FindNymphTarget();
                    if (oTarget != OBJECT_INVALID)
                        TransformTarget(oTarget);
                }
                else
                {
                    ActionMoveAwayFromObject(oPC, TRUE, 10.0);
                }
            }
        }
    }
    else if(nUser == 1006) // DAMAGED
    {
        if (GetLocalInt(OBJECT_SELF, "Generic_Surrender") == 1)
        {
            ClearAllActions(TRUE);
            return;
        }
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once

        if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= 30) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            ClearAllActions(TRUE);
            DestroyAllAllies();
            SurrenderToEnemies();
            SpeakOneLinerConversation();

            //Make sure there are no effects (like invis) still on the ogre mage
            effect eEffect = GetFirstEffect(OBJECT_SELF);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(OBJECT_SELF, eEffect);
                eEffect = GetNextEffect(OBJECT_SELF);
            }

            ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 2.0);
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

            Reward_2daXP(oPC, XP_HIGH, TRUE);


            AssignCommand(oPC, ClearAllActions(TRUE));
            DelayCommand(1.7, AssignCommand(oPC, ClearAllActions(TRUE)));
            DelayCommand(2.0, ActionStartConversation(oPC));
            DelayCommand(3.0, SetImmortal(OBJECT_SELF, FALSE));

            //HENCHMAN INTERJECTION
            AttemptInterjectionOrPopup(OBJECT_SELF, "x2_oneliner_nr", oPC, 10);
        }
    }
    else if (nUser == 1007)  // On death
    {
        SetLocalInt(GetModule(),"FairyQueen",20);  // Variable for the fairy queens conversation
    }


}

object FindNymphTarget()
{
    string szRandom = IntToString(Random(5) + 1);

    object oTarget = GetNearestObjectByTag("q2bnymph_t" + szRandom);
    if (GetIsObjectValid(oTarget) == TRUE)
        return oTarget;

    return OBJECT_INVALID;

}

void TransformTarget(object oTarget)
{
    //SendMessageToPC(GetFirstPC(), "Transforming : " + GetName(oTarget));
    int nType = StringToInt(GetStringRight(GetTag(oTarget), 1));
    string szResRef;
    switch (nType)
    {
        //target is a dog
        case 1:     szResRef = "q2b_fq_wolf";
                    break;
        //target is a chicken
        case 2:     szResRef = "q2b_fq_chick";
                    break;
        //target is a butterfly
        case 3:     szResRef = "q2b_fq_dragon";
                    break;
        //target is a well
        case 4:     szResRef = "q2b_fq_water";
                    break;
        //target is a tree
        case 5:     szResRef = "q2b_fq_tree";
                    break;
    }
    //SendMessageToPC(GetFirstPC(), "ResRef: " + szResRef);
    location lLoc = GetLocation(oTarget);
    ClearAllActions(TRUE);
    ActionCastFakeSpellAtLocation(SPELL_GRENADE_HOLY, lLoc);

    //Apply a transformation effect
    effect eTransform1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
    effect eTransform2 = EffectVisualEffect(VFX_IMP_DISPEL);
    effect eTransform3 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    effect eTransform4 = EffectVisualEffect(471);
    effect eLink1 = EffectLinkEffects(eTransform1, eTransform2);
    effect eLink2 = EffectLinkEffects(eTransform3, eTransform4);
    effect eLink = EffectLinkEffects(eLink1, eLink2);
    DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lLoc));
    DestroyObject(oTarget, 5.0);

    DelayCommand(5.5, CreateMinion(szResRef, lLoc));

}



void CreateMinion(string szResRef, location lLoc)
{
    object oMinion = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lLoc);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oMinion);
    AssignCommand(oMinion, DetermineCombatRound(oPC));
}


void DestroyAllAllies()
{
    object oArea = GetArea(OBJECT_SELF);
    string szTag;
    string szTag1 = "q2b_fq_wolf";
    string szTag2 = "q2b_fq_chick";
    string szTag3 = "q2b_fq_dragon";
    string szTag4 = "q2b_fq_water";
    string szTag5 = "q2b_fq_tree";
    string szTag6 = "q2b07smallfairy";

    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    location lAlly;

    object oAlly = GetFirstObjectInArea(oArea);
    while (oAlly != OBJECT_INVALID)
    {
        szTag = GetTag(oAlly);
       if (szTag == szTag1 || szTag == szTag2 || szTag == szTag3 ||
            szTag == szTag4 || szTag == szTag5 || szTag == szTag6)
       {
            AssignCommand(oAlly, ClearAllActions(TRUE));
            lAlly = GetLocation(oAlly);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lAlly);
            DestroyObject(oAlly);
       }
       else
       {
            AssignCommand(oAlly, ClearAllActions(TRUE));
       }
       oAlly = GetNextObjectInArea(oArea);
    }
    //object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    //AdjustReputation(oPC, OBJECT_SELF, 50);
}


