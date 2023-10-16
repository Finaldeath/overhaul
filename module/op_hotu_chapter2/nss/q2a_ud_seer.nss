//::///////////////////////////////////////////////
//:: q2a_ud_seer
//::
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Controls Seer ritual during Battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////

const int SEER_EFFECT_HEAL = 1;
const int SEER_EFFECT_HARM = 1;

void SeerSpellEffect(object oCentre, int nEffect);

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 998)//Move to Start point - in case seer gets bumped during the rush of defenders
    {
        ClearAllActions();
        object oWP = GetWaypointByTag("wp_bat2_seer");
        ActionMoveToObject(oWP, TRUE);
    }
    else if(nEvent == 999)
    {
        //Since the Seer's corpse sticks around - we should make sure she's still alive
        if (GetIsDead(OBJECT_SELF) == TRUE)
            return;
        //SendMessageToPC(GetFirstPC(), "Seer Event");
        int nCasting = GetLocalInt(OBJECT_SELF, "Q2B_CASTING");

        if(nCasting == 1)
        {
            effect eVis;
            object oWP = GetWaypointByTag("wp_bat2_seer");
            if(!GetCommandable())
                SetCommandable(TRUE);

            //Make sure she's close enough to the waypoint (in the circle)
            if (GetDistanceToObject(oWP) > 4.0)
                ActionMoveToObject(oWP, TRUE, 3.0);

            int nRand = Random(10) + 1;
            switch(nRand)
            {
                case 1:
                    //ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    //ActionPlayAnimation(ANIMATION_FIREFORGET_READ);

                case 2:
                    ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 10.0);
                    //ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED);
                    break;
                case 3:
                    ActionCastFakeSpellAtLocation(SPELL_HEALING_CIRCLE, GetLocation(oWP));
                    DelayCommand(2.0, SeerSpellEffect(oWP, SEER_EFFECT_HEAL));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);

                    break;
                case 4:
                    ActionCastFakeSpellAtLocation(SPELL_GREATER_DISPELLING, GetLocation(oWP));
                    DelayCommand(2.0, SeerSpellEffect(oWP, SEER_EFFECT_HEAL));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                case 5:
                    ActionCastFakeSpellAtLocation(SPELL_EPIC_HELLBALL, GetLocation(oWP));
                    eVis = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
                    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP)));
                    DelayCommand(2.0, SeerSpellEffect(oWP, SEER_EFFECT_HARM));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                case 6:
                    ActionCastFakeSpellAtLocation(SPELL_WORD_OF_FAITH, GetLocation(oWP));
                    DelayCommand(2.0, SeerSpellEffect(oWP, SEER_EFFECT_HEAL));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                    break;
                default:
                    break;
            }
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(999)));
        }
    }

    return;
    //SPELL_PLANAR_BINDING
    //
    //
}

void SeerSpellEffect(object oCentre, int nEffect)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oCentre);

    //Apply the Summoning Circle Effect
    object oCircle = CreateObject(OBJECT_TYPE_PLACEABLE, "q2a_bat2_circle", lTarget);
    DelayCommand(1.0, AssignCommand(oCircle, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0)));
    DelayCommand(9.5, SetPlotFlag(oCircle, FALSE));
    DestroyObject(oCircle, 10.0);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);

    //Possible visual effects
    effect eVisHeal = EffectVisualEffect(68);//Heal M Impact
    effect eVisHarm = EffectVisualEffect(60);//Flame Impact
    effect eHeal = EffectHeal(25);
    effect eHarm = EffectDamage(25);
    effect eHealLink = EffectLinkEffects(eVisHeal, eHeal);
    effect eHarmLink = EffectLinkEffects(eVisHarm, eHarm);

    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
        {
            //if the effect was a heal effect - heal friendlies in the Area of Effect
            if (nEffect == SEER_EFFECT_HEAL)
            {
                //Heal anyone who is neutral or better
                if (GetReputation(OBJECT_SELF, oTarget) > 10)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealLink, oTarget);
                }
            }
            //else the effect was a harm effect - harm enemies in the Area of Effect
            else
            {
                //Harm anyone who is an enemy
                if (GetReputation(OBJECT_SELF, oTarget) < 11)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHarmLink, oTarget);
                }
            }
        }
       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    }
}

