//::///////////////////////////////////////////////
//:: Name q1h_ud_blake
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Mr. Blake will appear to be dead until
        spoken to...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1001)
    {

        //First HB - knock Blake down
        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(4), OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), OBJECT_SELF);
        }
        //if Blake is finished - move him to his end position.
        if (GetLocalInt(OBJECT_SELF, "nEndGame") == 1)
        {
            ActionMoveToObject(GetWaypointByTag("wp_q1h_post_adam"));
        }
        //If Blake is not set to follow - either keep him knocked down or move him to NOra
        else if (GetLocalInt(OBJECT_SELF, "nFollow") != 1)
        {
            if (GetLocalInt(GetModule(), "X1_BLAKEHASBABY") == 1 || GetLocalInt(GetModule(), "X1_Q1HPCHASBABY") == 1)
            {
                ActionMoveToObject(GetObjectByTag("q1bnora"));
            }
            else if (GetMaxHitPoints(OBJECT_SELF) == GetCurrentHitPoints(OBJECT_SELF))
            {
                AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));
                SetLocalInt(OBJECT_SELF, "nCured", 1);
            }
            else if(IsInConversation(OBJECT_SELF) == FALSE && GetCurrentAction() == ACTION_INVALID && GetLocalInt(OBJECT_SELF, "nTalking") != 1 && GetLocalInt(OBJECT_SELF, "nCured") != 1)
            {
                ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,4000.0);
            }
        }
        //if he is set to follow - force follow his leader (set in dialog)
        else
        {
            if (GetIsInCombat() == FALSE)
            {
                object oLeader = GetLocalObject(OBJECT_SELF, "oLeader");
                //Check to see if anyone has been set as Adam's leader through his conversation
                if (oLeader != OBJECT_INVALID)
                {
                    AssignCommand(OBJECT_SELF, ActionForceFollowObject(oLeader));
                }
            }
        }
    }
    else if(nUser == 1007) // DEATH
    {
        //Set Blake is dead variable
        SetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD", 1);
    }
    else if (nUser == EVENT_SPELL_CAST_AT)
    {
        //if helpful spell cast at Blake - cure him and stand him up - initiate dialog with caster
        int nSpell = GetLastSpell();
        object oCaster = GetLastSpellCaster();
        if (nSpell == SPELL_CURE_LIGHT_WOUNDS || nSpell == SPELL_CURE_MINOR_WOUNDS || nSpell == SPELLABILITY_LAY_ON_HANDS)
        {
            effect eEffect = GetFirstEffect(OBJECT_SELF);
            RemoveEffect(OBJECT_SELF, eEffect);
            SetLocalInt(OBJECT_SELF, "nCured", 1);
            SetLocalInt(OBJECT_SELF, "nLayOnHands", 1);
            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));
            DelayCommand(1.5, ActionStartConversation(oCaster));
        }
    }
}

