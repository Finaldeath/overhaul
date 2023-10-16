//::///////////////////////////////////////////////
//:: Name q1g_ud_sleeper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Injured human will be lieing on the ground...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1001)
    {

        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(4), OBJECT_SELF);
        }
        if (GetLocalInt(OBJECT_SELF, "nHealed") != 1)
        {
            if (GetLocalInt(OBJECT_SELF, "nDoingSomething") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nDoingSomething", 1);
                ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,4000.0);
                SetCommandable(FALSE);
                DelayCommand(3998.0, SetLocalInt(OBJECT_SELF, "nDoingSomething", 0));
                DelayCommand(3999.0, SetCommandable(TRUE));
            }
        }
        else
        {
            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 2.0));
            //Maybe play ambient animation here - after healing
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if (nUser == EVENT_SPELL_CAST_AT)
    {
        int nSpell = GetLastSpell();
        object oCaster = GetLastSpellCaster();
        //spell 506 is for healing kits..
        if ((nSpell == SPELL_CURE_LIGHT_WOUNDS || nSpell == SPELL_CURE_MINOR_WOUNDS || nSpell == SPELL_CURE_MODERATE_WOUNDS || nSpell == SPELL_CURE_SERIOUS_WOUNDS || nSpell == SPELL_CURE_CRITICAL_WOUNDS || nSpell == SPELLABILITY_LAY_ON_HANDS || nSpell == 506) && GetLocalInt(OBJECT_SELF, "nHealed") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nHealed", 1);

            SetCommandable(TRUE);
            DelayCommand(1.2, SetFacingPoint(GetPosition(oCaster)));
            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));
            if (GetLocalInt(OBJECT_SELF, "nRewardedOnce") != 1)
            {
                GiveXPToCreature(oCaster, 25);
                AdjustAlignment(oCaster, ALIGNMENT_GOOD, 1);
                SetLocalInt(OBJECT_SELF, "nRewardedOnce", 1);
            }
            DelayCommand(1.5, SpeakOneLinerConversation());
        }
    }
}

