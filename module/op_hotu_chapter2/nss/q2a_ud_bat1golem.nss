//::///////////////////////////////////////////////
//:: Drow Battle 1: On User Defined
//:: q2a_ud_bat1golem
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////

void RockDamage(location lImpact);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;

    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == 500)//ATTEMPTED ATTACK
    {//Choose a random target (1-3) within 50 meters and launch rock at it..

        if (GetLocalInt(OBJECT_SELF, "nTimer") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nTimer", 1);
        float fRandom = 10.0 + IntToFloat(Random(4));
        DelayCommand(fRandom, SetLocalInt(OBJECT_SELF, "nTimer", 0));

        int nEnemy = 1;
        object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nEnemy);
        //if the target is within 10 meters - physcially attack it.
        //Check for enemy (not on a ledge) within 10 meters
        if (GetIsObjectValid(oTarget) == TRUE && GetDistanceToObject(oTarget) < 10.0 && GetLocalInt(oTarget, "Q2A_OnLedge") != 1)
        {
            ActionAttack(oTarget);
        }
        else
        {   //throw rock at random enemy
            nEnemy = Random(3) + 1;
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nEnemy);
            if (GetIsObjectValid(oTarget) == TRUE)
            {
                ClearAllActions(TRUE);

                ActionCastSpellAtLocation(773, GetLocation(oTarget), METAMAGIC_ANY, TRUE);


            }
            //if no valid target - move towards gate
            else
            {
                ClearAllActions();
                object oGolemTarget = GetObjectByTag("q2agolemtarget");
                ActionMoveToObject(oGolemTarget);
            }
        }
        DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(500)));


    }

    else if (nEvent == 5004)//General Retreat
    {
        object oTarget = GetObjectByTag("wp_bat1_retreat");
        ClearAllActions(TRUE);
        DelayCommand(0.2, ActionMoveToObject(GetLocalObject(OBJECT_SELF, "oTarget")));
        DelayCommand(0.4, SetCommandable(FALSE, OBJECT_SELF));
        //DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5004)));
    }
    return;

}

void RockDamage(location lImpact)
{
    float fDelay;
    int nDamage;
    effect eDam;
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_HUGE, lImpact, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the spell shape until an invalid object is captured.

    while (GetIsObjectValid(oTarget))
    {
        if (!GetPlotFlag(oTarget))
        {
            //Fire cast spell at event for the specified target
           //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FIREBALL));
            //Get the distance between the explosion and the target to calculate delay
            fDelay = GetDistanceBetweenLocations(lImpact, GetLocation(oTarget))/20;
            //Roll damage for each target, but doors are always killed
            if  (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
                nDamage = d6(5) + 5;//GetCurrentHitPoints(oTarget)+1;
            else
                nDamage = d6(2)+5;
            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_FIRE);
            //Set the damage effect
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
            if(nDamage > 0)
            {
                // Apply effects to the currently selected target.
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                //This visual effect is applied to the target object not the location as above.  This visual effect
                //represents the flame that erupts on the target not on the ground.
                //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            }
        //Select the next target within the spell shape.
        }
        oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_HUGE, lImpact, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }
}


