//::///////////////////////////////////////////////
//:: Name           Battle Formation: Ballista on Heart
//:: FileName       q2a_hb_drowcat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Placeable's script file
    On Heart script for the ballista placeable.
    Note that the Ballista is considered as
    a formationmaster (uses the same functions)
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 20/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"

const int nBallistaFireChancePercentage = 50;
void CreateSmoke(location lTarget);
void CreateMark(location lTarget, string szResRef);

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
        return;

    if (GetLocalInt(GetModule(), "X2_Q2aBattle1Lost") == 1)
        return;

    object oBallista = OBJECT_SELF;

    //Add check to see if Ballista crew is still living.*******
    if (DrowCatapult_FireTeamAlive(oBallista) == TRUE)
    {
        object oFirer = GetNearestObjectByTag("q2a_drowcatteam", oBallista);
        //AssignCommand(oFirer, ActionMoveToObject(oBallista, TRUE));
        //DelayCommand(1.0, AssignCommand(oFirer, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0)));
        // % chance that the ballista is firing
        if (d100() > nBallistaFireChancePercentage ) return;

        object oTargetLocation  = DrowCatapult_PickTargetArea();
        object oTargetUnit = DrowCatapult_PickTargetUnit(oTargetLocation);

        //If there is a unit in the target square - fire at him
        if (GetIsObjectValid(oTargetUnit) == TRUE)
        {
            int nRandom = Random(3);
            if ( nRandom == 0)
                DelayCommand(2.0, ActionCastSpellAtObject(SPELL_FIREBALL, oTargetUnit, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC));
            else if (nRandom == 1)
                DelayCommand(2.0, ActionCastSpellAtObject(SPELL_FLAME_ARROW, oTargetUnit, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC));
            else
                DelayCommand(2.0, ActionCastSpellAtObject(SPELL_ISAACS_LESSER_MISSILE_STORM, oTargetUnit, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC));
            location lTarget = GetLocation(oTargetUnit);
            //Create VFX on impact
            CreateSmoke(lTarget);


        }
        //else just fire at the target zone..
        else
        {
            location lTarget = DrowCatapult_PickRandomLocation(oTargetLocation);
            DelayCommand(2.0, ActionCastSpellAtLocation(SPELL_FIREBALL, lTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC));

            //Create VFX on impact
            CreateSmoke(lTarget);
        }

     }
}

//Create a random effect at the target location - smoke, scorch mark or fire
//Destroy the effect after 10 seconds
void CreateSmoke(location lTarget)
{
    location lSelf = GetLocation(OBJECT_SELF);
    float fRange = GetDistanceBetweenLocations(lSelf, lTarget);
    float fImpactDelay = fRange/12.0 + 2.0;
    effect eSmoke;
    int nRandom = Random(6);
    switch (nRandom)
    {
        case 0: eSmoke = EffectVisualEffect(VFX_DUR_SMOKE);
                DelayCommand(fImpactDelay, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSmoke, lTarget, 10.0));
                break;
        case 1:
        case 2:
        case 3: DelayCommand(fImpactDelay, CreateMark(lTarget, "x2_plc_scorch"));
                break;
        case 4:
        case 5: DelayCommand(fImpactDelay, CreateMark(lTarget, "x2_plc_flame"));
                break;
    }
}

void CreateMark(location lTarget, string szResRef)
{
    object oScorch = CreateObject(OBJECT_TYPE_PLACEABLE, szResRef, lTarget);
    DestroyObject(oScorch, 10.0);
}


