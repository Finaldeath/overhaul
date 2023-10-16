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

const int   bUSE_ARCHERS = TRUE;   /////<---------     //////////////
const int   bARCHERS_USE_FAKE_ARROWS_VOLLEY = TRUE;
const int   bARCHERS_USE_TRUE_ARROWS_VOLLEY = FALSE;
const int   bARCHERS_USE_AOE_ARROWS_VOLLEY = FALSE;
const int   nARCHERS_MAX_PERIOD_BETWEEN_VOLLEY =10;
const float fARCHERS_PERIOD_MULTIPLIER = 1.0f;
// 10, 0.1 gives a nearly constant rain of arrows
// 20, 2.0 gives more sporadic volleys of arrows
// 10, 1 is about right

const int nBallistaFireChancePercentage = 50;
void CreateSmoke(location lTarget);
void CreateMark(location lTarget, string szResRef);
void BTF_ARCHR_ONUSDF_VolleyDamageEffect(location lVolleySource, location lTarget);
void BTF_ARCHR_ONUSDF_CreateFakeVolleyAtLocation(location lTarget, int nArrowSpell = SPELL_TRAP_ARROW, int nPathType= PROJECTILE_PATH_TYPE_BALLISTIC);

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
        location lTarget = DrowCatapult_PickRandomLocation(oTargetLocation);
        //object oTargetUnit = DrowCatapult_PickTargetUnit(oTargetLocation);

        BTF_ARCHR_ONUSDF_VolleyDamageEffect(GetLocation(OBJECT_SELF), lTarget);
        BTF_ARCHR_ONUSDF_CreateFakeVolleyAtLocation(lTarget);

        /*
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
        */
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

void BTF_ARCHR_ONUSDF_VolleyDamageEffect(location lVolleySource, location lTarget)
{
    effect eDam;
    //effect eArrow = EffectVisualEffect(357);
    effect eKnock = EffectKnockdown();
    int nArrowIndex;
    int nNbOfArrows;
    int nDamage;


    //Get the distance between the explosion and the target to calculate delay
    float fDelay = GetDistanceBetweenLocations(lVolleySource, lTarget)/15;

    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_LARGE, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE  );
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {

        if (!ReflexSave(oTarget, 20, SAVING_THROW_REFLEX))
        {
            nArrowIndex = 0;
            nNbOfArrows = d4();
            while (nArrowIndex < nNbOfArrows)
            {
                //Roll damage for each target
                nDamage = d8();
                //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
                eDam = EffectDamage(nDamage, DAMAGE_TYPE_PIERCING);
                float fIndividualArrowDelay = d4()*0.5f;
                float fArrowDelay = fDelay+ fIndividualArrowDelay;

                // Apply effects to the currently selected target.
                DelayCommand(fArrowDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                DelayCommand(fArrowDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, 4.0f));
                DelayCommand(fIndividualArrowDelay, ActionCastFakeSpellAtObject(SPELL_TRAP_ARROW, oTarget, PROJECTILE_PATH_TYPE_BALLISTIC));

                nArrowIndex++;

             }
       }
       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_LARGE, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE );

    }
}

void BTF_ARCHR_ONUSDF_CreateFakeVolleyAtLocation(location lTarget, int nArrowSpell, int nPathType)
{

        vector vFoePosition = GetPositionFromLocation(lTarget);
        location lArrowTargetLocation;
        int nArrowIndex = 0;
        int nNbOfArrows = 10+d10();
        object oArea = GetAreaFromLocation(lTarget);

        float fArrowDelay;
        while( nArrowIndex < nNbOfArrows)
        {
            fArrowDelay = 0.2f*d20();
            lArrowTargetLocation = Location(oArea, Vector(vFoePosition.x + (d20() - 10)*0.4f, vFoePosition.y + (d20() - 10)*0.4f, vFoePosition.z), 0.0f);
            DelayCommand(fArrowDelay, ActionCastFakeSpellAtLocation(nArrowSpell, lArrowTargetLocation, nPathType));
            nArrowIndex++;
        }


}


