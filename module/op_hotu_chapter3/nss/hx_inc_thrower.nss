//::///////////////////////////////////////////////
//:: Name hx_inc_thrower
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This include will handle the throwing of
     objects done by the demons in the Blood War.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 19, 2003
//:://////////////////////////////////////////////

// Do the throw action.
void ActionThrowObject(object oObject, object oEnemy);
// Get the closest object that can be thrown.
object GetThrowObject();
// Get the closest enemy in range.
object GetEnemy();
// Time when the explosion should happen.
// Borrowed from: Rob Bartel's Catapults! module.
float GetExplosionTime(location lLoc, int iSpell);
// Do impact damage.
void DoRadiusDamage(int iSpell, object oObject, location lLoc, int iExplosion, int iDamage, int iDamageType, float fRadius);

//////////////////////////////////////////////////

// Get the closest object that can be thrown.
object GetThrowObject()
{
    int x = 1;
    object oNear = GetNearestObjectByTag("hx_throw_object", OBJECT_SELF, x);
    //object oTaken;
    //int iTaken;

    while(GetIsObjectValid(oNear))
    {
        return oNear;
    }

    return OBJECT_INVALID;
}

// Get the closest enemy in range.
object GetEnemy()
{
    object oObject = GetFirstObjectInShape(SHAPE_SPHERE, 100.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE);
    float fDist;

    SetLocalInt(OBJECT_SELF, "HX_ENEMY_OOR", 0);

    while(GetIsObjectValid(oObject))
    {
        fDist = GetDistanceToObject(oObject);

        if(GetFactionAverageReputation(OBJECT_SELF, oObject) < 10)
        {
            if(fDist >= 10.0 && fDist <= 40.0)
            {
                return oObject;
            }
            // Track an enemy that is out of range.
            else
            {
                SetLocalInt(OBJECT_SELF, "HX_ENEMY_OOR", 1);
            }
        }
        oObject = GetNextObjectInShape(SHAPE_SPHERE, 100.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE);
    }
    if(GetLocalInt(OBJECT_SELF, "HX_ENEMY_OOR") == 1)
    {
        return OBJECT_SELF;
    }
    else
    {
        return OBJECT_INVALID;
    }
}

// Do the throw action.
void ActionThrowObject(object oObject, object oEnemy)
{
    location lLoc = GetLocation(oEnemy);
    vector vPos = GetPosition(oEnemy);
    string sName = GetName(oObject);
    int iSpell;
    int iExplosion;
    int iDamage;
    int iDamageType;
    float fRadius;
    float fDelay;

    // Get the object being thrown and determine all of the effects.
    // Check for male/female for voices.
    // If the explosion is set to 9999, then it will be a default explosion
    // where the object is created and destroyed quickly.

    // Boulder.
    if(sName == "Boulder")
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            iSpell = 751;
            iExplosion = 9999;
            iDamage = Random(30) + 25;
            iDamageType = DAMAGE_TYPE_BLUDGEONING;
            fRadius = 5.0;
        }
        else
        {
            iSpell = 751;
            iExplosion = 9999;
            iDamage = Random(30) + 25;
            iDamageType = DAMAGE_TYPE_BLUDGEONING;
            fRadius = 5.0;
        }
    }
    // Brazier.
    else if(sName == "Brazier")
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            iSpell = 749;
            iExplosion = VFX_FNF_FIREBALL;
            iDamage = Random(10) + 25;
            iDamageType = DAMAGE_TYPE_FIRE;
            fRadius = 3.0;
        }
        else
        {
            iSpell = 749;
            iExplosion = VFX_FNF_FIREBALL;
            iDamage = Random(10) + 25;
            iDamageType = DAMAGE_TYPE_FIRE;
            fRadius = 3.0;
        }
    }
    // Broken Catapult.
    else if(sName == "Wrecked Catapult")
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            iSpell = 748;
            iExplosion = 9999;
            iDamage = Random(30) + 10;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 5.0;
        }
        else
        {
            iSpell = 748;
            iExplosion = 9999;
            iDamage = Random(30) + 10;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 5.0;
        }
    }
    // Fence.
    else if(sName == "Fence")
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            iSpell = 750;
            iExplosion = 9999;
            iDamage = Random(20) + 10;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 6.0;
        }
        else
        {
            iSpell = 750;
            iExplosion = 9999;
            iDamage = Random(20) + 10;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 6.0;
        }
    }
    // Dead Tree.
    else if(sName == "Dead Tree")
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            iSpell = 752;
            iExplosion = 9999;
            iDamage = Random(40) + 15;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 6.0;
        }
        else
        {
            iSpell = 752;
            iExplosion = 9999;
            iDamage = Random(40) + 15;
            iDamageType = DAMAGE_TYPE_PIERCING;
            fRadius = 6.0;
        }
    }

    fDelay = GetExplosionTime(lLoc, iSpell);

    if(GetIsPC(OBJECT_SELF))
    {
        SetCutsceneMode(OBJECT_SELF, TRUE);
        DelayCommand(6.5, SetCutsceneMode(OBJECT_SELF, FALSE));
    }
    // Start the throw actions.
    ClearAllActions(TRUE);
    SetFacingPoint(GetPosition(oObject));
    DelayCommand(0.2, DestroyObject(oObject));
    DelayCommand(0.8, PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0));
    DelayCommand(1.4, PlaySound("bf_med_hard"));
    DelayCommand(1.9, ClearAllActions(TRUE));
    DelayCommand(2.0, ActionCastFakeSpellAtLocation(iSpell, lLoc));
    if(GetIsPC(OBJECT_SELF))
    {
        DelayCommand(2.5, SetCameraFacing(GetFacing(OBJECT_SELF), -1.0, -1.0, CAMERA_TRANSITION_TYPE_MEDIUM));

    }
    DelayCommand(3.6 + fDelay, DoRadiusDamage(iSpell, oObject, lLoc, iExplosion, iDamage, iDamageType, fRadius));
}

// Time when the explosion should happen.
// Borrowed from: Rob Bartel's Catapults! module.
float GetExplosionTime(location lLoc, int iSpell)
{
    float fDist = GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), lLoc);

    if(iSpell == 749)
    {
        if(fDist <= 12.0)
        {
            return (fDist /12) + 0.3;
        }
        else
        {
            return (fDist / 12) - 0.3;
        }
    }
    else
    {
        return (fDist / 12);
    }
}

// Do impact damage.
void DoRadiusDamage(int iSpell, object oObject, location lLoc, int iExplosion, int iDamage, int iDamageType, float fRadius)
{
    object oDamaged = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lLoc, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    string sRes = GetResRef(oObject);
    effect eEffect;

    //if(iSpell == VFX_FNF_FIREBALL)
    //{
    //    eEffect = EffectVisualEffect(VFX_IMP_FLAME_S);
    //}
    //else
    //{
    //    eEffect = EffectVisualEffect(353);
    //}

    // Special hand-made effect.

    if(iExplosion == 9999)
    {
        object oExplode = CreateObject(OBJECT_TYPE_PLACEABLE, sRes, lLoc);
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oExplode));
        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), lLoc));
        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc));
    }
    else
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(iExplosion), lLoc);
    }

    // Damage.
    while(GetIsObjectValid(oDamaged))
    {
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, iDamageType), oDamaged));
        //if(GetObjectType(oDamaged) != OBJECT_TYPE_PLACEABLE)
        //{
        //    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oDamaged));
        //}
        oDamaged = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lLoc, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    }
}
