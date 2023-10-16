//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2a_ud_deekin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Deekin's user defined stuff
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "X2_DeekinLeveled") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "X2_DeekinLeveled", 1);

        //Level up henchman to level 13
        int nLevel = 1;
        for (nLevel = 1; nLevel < 14; nLevel++)
        {
            LevelUpHenchman(OBJECT_SELF);
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
                if (GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY)) == TRUE)
                {
                    switch (Random(3) + 1)
                    {
                        case 1: PlaySpeakSoundByStrRef(84005);
                                break;
                        case 2: PlaySpeakSoundByStrRef(84006 );
                                break;
                        case 3: PlaySpeakSoundByStrRef(84007 );
                                break;
                    }
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
            SetLocalInt(GetModule(), "X2_cut1deekinH", 1);
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
        if (GetTag(GetLastSpellCaster()) != GetTag(OBJECT_SELF))
        {
            if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION)
            {
                PlaySpeakSoundByStrRef(84008);
                SetLocalInt(OBJECT_SELF, "nDamaged", 0);
            }
        }
    }
}

