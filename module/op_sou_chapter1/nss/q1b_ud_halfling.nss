//::///////////////////////////////////////////////
//:: Name q1b_ud_halfling
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Injured halflings will be lieing on the ground...
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
        //On first heartbeat - apply damage
            if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(4), OBJECT_SELF);
                SetPlotFlag(OBJECT_SELF, TRUE);
            }
            //If this halfling has not been healed before
            if (GetLocalInt(OBJECT_SELF, "nHealed") != 1)
            {
                if (GetCurrentHitPoints() == GetMaxHitPoints())
                {
                    SetLocalInt(OBJECT_SELF, "nHealed", 1);
                    SetLocalInt(GetModule(), "X1_Q1BHalflingsHealed", GetLocalInt(GetModule(), "X1_Q1BHalflingsHealed") + 1);

                    SetCommandable(TRUE);
                    AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));

                }
                //Keet the halfling down on the ground
                else if (GetLocalInt(OBJECT_SELF, "nDoingSomething") != 1)
                {
                    SetLocalInt(OBJECT_SELF, "nDoingSomething", 1);
                    ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,14000.0);
                    SetCommandable(FALSE);
                    DelayCommand(13998.0, SetLocalInt(OBJECT_SELF, "nDoingSomething", 0));
                    DelayCommand(13999.0, SetCommandable(TRUE));
                }
            }
            //After healing - play some ambient stuff
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
        object oPC = GetLastSpellCaster();
        //spell 506 is for healing kits..
        if ((nSpell == 506 || nSpell == SPELL_CURE_LIGHT_WOUNDS || nSpell == SPELL_CURE_MINOR_WOUNDS || nSpell == SPELL_CURE_MODERATE_WOUNDS || nSpell == SPELL_CURE_SERIOUS_WOUNDS || nSpell == SPELL_CURE_CRITICAL_WOUNDS || nSpell == SPELLABILITY_LAY_ON_HANDS) && GetLocalInt(OBJECT_SELF, "nHealed") != 1)
        {

            SetLocalInt(OBJECT_SELF, "nHealed", 1);
            SetLocalInt(GetModule(), "X1_Q1BHalflingsHealed", GetLocalInt(GetModule(), "X1_Q1BHalflingsHealed") + 1);

            SetCommandable(TRUE);
            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));
            if (GetLocalInt(OBJECT_SELF, "nRewardedOnce") != 1)
            {
                GiveXPToCreature(oPC, 25);
                AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
                SetLocalInt(OBJECT_SELF, "nRewardedOnce", 1);
            }

            DelayCommand(1.5, SpeakOneLinerConversation());
        }
    }

}

