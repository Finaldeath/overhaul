//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName:q2a_ud_durnan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After the battle on the main floor of the
    Yawning Portal - Duran will run down to
    the well room...
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //after the attack on the Yawning Portal is over - Durnan will shout for others
        //to join him to defend the well room
        if (GetLocalInt(GetModule(), "X2_ypattack") == 2)
        {
            if (GetLocalInt(OBJECT_SELF, "nJumpedWell") != 1)
            {
                if (GetIsInCombat() == FALSE && IsInConversation(OBJECT_SELF) == FALSE)
                {
                    if(GetLocalInt(OBJECT_SELF, "nYelledOnce") != 1)
                    {
                        SetLocalInt(OBJECT_SELF, "nYelledOnce", 1);
                        PlaySpeakSoundByStrRef(84015);
                        SetLocalInt(GetModule(), "X2_DurnanGoToWell", 1);
                    }
                    if (GetDistanceToObject(GetWaypointByTag("wp_q2a_wellstairs")) > 10.0)
                    {
                        //AssignCommand(OBJECT_SELF, ClearAllActions());
                        AssignCommand(OBJECT_SELF, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_q2a_wellstairs")), TRUE));
                    }
                    else
                    {
                        AssignCommand(OBJECT_SELF, JumpToObject(GetWaypointByTag("wp_q2awell_durnan")));
                        SetLocalInt(OBJECT_SELF, "nJumpedWell", 1);
                    }
                }
            }
        }

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if (GetLocalInt(GetModule(), "DurnanSpoke") != 3)
        {
            if (Random(4) == 1)
            {
                switch (Random(3) + 1)
                {
                    case 1: PlaySpeakSoundByStrRef(84016);
                            break;
                    case 2: PlaySpeakSoundByStrRef(84017);
                            break;
                    case 3: PlaySpeakSoundByStrRef(84018);
                            break;
                }
            }
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
        if (GetLocalInt(GetModule(), "X2_ypattack") == 2 ||GetLocalInt(GetModule(), "X2_ypattack") == 3)
        {
            if(GetCurrentHitPoints() == 1 && GetLocalInt(OBJECT_SELF, "nDamaged") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nDamaged", 1);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), OBJECT_SELF, 10.0);
                SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 70, OBJECT_SELF);
                DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectVisualEffect(VFX_IMP_HEALING_L), EffectHeal(GetMaxHitPoints()/2)), OBJECT_SELF));
                DelayCommand(10.0, SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 0, OBJECT_SELF));

            }
            //H is for Hurt
            SetLocalInt(GetModule(), "X2_q2adurnanH", 1);
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 1011) // ON SPELL CAST AT
    {
        if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION)
        {
            PlaySpeakSoundByStrRef(84019);
            SetLocalInt(OBJECT_SELF, "nDamaged", 0);
        }
    }
}

