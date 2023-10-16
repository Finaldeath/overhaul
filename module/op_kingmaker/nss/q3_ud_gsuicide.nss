//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_gsuicide
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goblin Suicide Bomber user defined event
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void Explode();

void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oPC = GetFirstPC();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetLocalInt(OBJECT_SELF,"OS_SET_EFFECT")==10)
        {
            if(GetDistanceBetween(OBJECT_SELF,oPC)<2.0)
            {
                Explode();
//                location lSelf = GetLocation(OBJECT_SELF);
//                ActionCastSpellAtLocation(SPELL_GRENADE_FIRE,lSelf,METAMAGIC_ANY,TRUE,TRUE);
//                ActionDoCommand(DestroyObject(OBJECT_SELF));
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        if(GetLastPerceived()==oPC
            && GetLocalInt(OBJECT_SELF,"OS_SET_EFFECT")==0)
        {
            SetLocalInt(OBJECT_SELF,"OS_SET_EFFECT",10);
            SpeakOneLinerConversation();
            ActionMoveToObject(oPC,TRUE);
        }
    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        if(GetLastKiller()==oPC)
        {
            Explode();
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

void Explode()
{
    if (GetLocalInt(OBJECT_SELF,"OS_DETONATING") == TRUE)
        return; // prevent recursions

    SetLocalInt(OBJECT_SELF,"OS_DETONATING",TRUE);
    location lLoc = GetLocation(OBJECT_SELF);
    effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL,FALSE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eBoom, lLoc);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eDam;
    float fDelay;
    int nDamage;
    //From here we use a modified version of Noel Borstad's fireball script
    effect eDest = EffectDeath();
    DelayCommand(0.3f,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDest,OBJECT_SELF));
//    PlaySound("sim_explsun");


    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the spell shape until an invalid object is captured.

    while (GetIsObjectValid(oTarget))
    {
        if (!GetPlotFlag(oTarget))
        {
            //Fire cast spell at event for the specified target
           //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FIREBALL));
            //Get the distance between the explosion and the target to calculate delay
            fDelay = GetDistanceBetweenLocations(lLoc, GetLocation(oTarget))/20;
            //Roll damage for each target, but doors are always killed
            if  (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
                nDamage = GetCurrentHitPoints(oTarget)+1;
            else
                nDamage = d6(2);

            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 20, SAVING_THROW_TYPE_FIRE);
            //Set the damage effect
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
            if(nDamage > 0)
            {
                // Apply effects to the currently selected target.
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                //This visual effect is applied to the target object not the location as above.  This visual effect
                //represents the flame that erupts on the target not on the ground.
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            }
        //Select the next target within the spell shape.
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }

}
