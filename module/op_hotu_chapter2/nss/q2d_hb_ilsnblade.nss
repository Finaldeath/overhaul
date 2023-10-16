//::///////////////////////////////////////////////
//:: Blade Barrier: Heartbeat
//:: q2d_hb_ilsnblade.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a wall 10m long and 2m thick of whirling
    blades that hack and slice anything moving into
    them.  Anything caught in the blades takes
    2d6 per caster level.
    *** This is only an illusion and the PC has a chance
    to disbelieve the effect and not take damage
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 20, 2001
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"

int CheckDisBeliever(object oTarget);
void DisbelieveWall(object oTarget);
void ClearAOE(object oObject);

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDisbelieved") == 1)
        return;
    //Declare major variables
    object oTarget;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_COM_BLOOD_LRG_RED);

    int nLevel = 10;

    oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(GetIsPC(oTarget) == TRUE)
        {
            //if the PC has already disbelieved this barrier then do nothing
            //otherwise...
            if (CheckDisBeliever(oTarget) == FALSE)
            {   //make a will save to see if the illusion is disbelieved
                if (WillSave(oTarget, 25, SAVING_THROW_TYPE_MIND_SPELLS) == 0)
                {
                    //Fire spell cast at event
                    SignalEvent(oTarget, EventSpellCastAt(GetAreaOfEffectCreator(), SPELL_BLADE_BARRIER));
                    //Make SR Check
                    if (!MyResistSpell(GetAreaOfEffectCreator(), oTarget) && oTarget != GetAreaOfEffectCreator())
                    {
                        //Roll Damage
                        int nDamage = d6(nLevel);

                        if(MySavingThrow(SAVING_THROW_REFLEX, oTarget, GetSpellSaveDC()))
                        {
                            nDamage = d6();
                        }
                        //Set damage effect
                        eDam = EffectDamage(nDamage, DAMAGE_TYPE_SLASHING);
                        //Apply damage and VFX
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                    }
                }
                else
                {
                    SetLocalInt(OBJECT_SELF, "nDisbelieved", 1);
                    DisbelieveWall(oTarget);
                }
            }
        }
        oTarget = GetNextInPersistentObject();
     }
}

//check if the Target has disbelieved this wall before
int CheckDisBeliever(object oTarget)
{
    int nFound = FALSE;
    int nString = 1;
    string szName = GetName(oTarget);
    string szSaveName = GetLocalString(OBJECT_SELF, "Disbeliever" + IntToString(nString));
    //if we haven't stored this PCs name - store it
    while (szSaveName != "")
    {
        if(szName == szSaveName)
            nFound = TRUE;
        nString++;
        szSaveName = GetLocalString(OBJECT_SELF, "Disbeliever" + IntToString(nString));
    }
    return nFound;
}

void DisbelieveWall(object oTarget)
{
    int nString = 1;
    string szSaveName = GetLocalString(OBJECT_SELF, "Disbeliever" + IntToString(nString));
    while (szSaveName != "")
    {
        nString++;
        szSaveName = GetLocalString(OBJECT_SELF, "Disbeliever" + IntToString(nString));
    }
    SetLocalString(OBJECT_SELF, "Disbeliever" + IntToString(nString), GetName(oTarget));
    FloatingTextStrRefOnCreature(85721, oTarget, FALSE);//"You recognize this wall of swords to be an illusion."

    ClearAOE(oTarget);
    object oVfx = GetNearestObjectByTag("vfx_q2d4_bladefake", oTarget);
    SetPlotFlag(oVfx, FALSE);
    DestroyObject(oVfx);
}

//Clear a sphere around a creature of all area of effect spells
void ClearAOE(object oObject)
{
    effect eVfx1 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eVfx2 = EffectVisualEffect(VFX_IMP_HEALING_M);

    effect eVfx5 = EffectVisualEffect(VFX_IMP_DEATH);


    effect eLink1 = EffectLinkEffects(eVfx1, eVfx2);

    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oObject);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink1, GetLocation(oTarget));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx5, GetLocation(oTarget));
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
    DestroyObject(OBJECT_SELF, 2.0);
}
