//::///////////////////////////////////////////////
//:: Include file for Bouncing puzzle
//:: inc_km_lld_pzzl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This include file is for the bouncing puzzle system
    in the Bastion of the Enemy final dungeon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

const int PUZ_TUNREDOFF = 0;
const int PUZ_TUNREDON  = 1;
const int PUZ_OVERDRIVE = 2;

void Debug (string sString);
void LaunchProjectile (object oProjSource, int iDirection, int iPowerLevel);

// Simple function for debug feedback to the console and logs
void Debug (string sString)
{
    SendMessageToPC(GetFirstPC(), sString);
    PrintString("Debug - " + sString);
}

// Throw the projectile at its target and deal effects
void LaunchProjectile (object oProjSource, int iDirection, int iPowerLevel)
{
    string sFacing, sTarget, sDest1, sDest2, sSour1, sSour2, sSource;
    object oTarget, oDamaged, oTemp;
    object oSelf = OBJECT_SELF;

    object oHench1 = GetHenchman(GetFirstPC(), 1);
    object oHench2 = GetHenchman(GetFirstPC(), 2);
    object oController = GetObjectByTag("km_finalcontroller");

    int iMirror = GetLocalInt(oSelf, "MIRROR");
    int iState = GetLocalInt(oController, "PUZ_STATE");
    int iDuration = 0;
    float fDelay = 0.0f;

    string sSourceTag = GetTag(oProjSource);
    string sTag = GetTag(oSelf);

    effect eDamage;
    effect eStunned;
    effect eVFXExplode1 = EffectVisualEffect(VFX_FNF_LOS_NORMAL_10);
    effect eVFXExplode2 = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eVFXDeflect = EffectVisualEffect(VFX_IMP_DISPEL);
    effect eVFXBurn = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eSonic = EffectVisualEffect(VFX_IMP_STUN);
    effect eBurn = EffectVisualEffect(VFX_IMP_FLAME_M);
    int iMulti = GetLocalInt(oSelf, "MULTI_POSITIONAL");

    // Verfiy which direction the project tile should be traveling
    sTarget = GetLocalString(oSelf, "CURRENTDEST");
    sDest1 = GetLocalString(oSelf, "DESTINATION1");
    sDest2 = GetLocalString(oSelf, "DESTINATION2");
    sSour1 = GetLocalString(oSelf, "SOURCE1");
    sSour2 = GetLocalString(oSelf, "SOURCE2");

    if (sTarget == sSourceTag)
    {
        sTarget = sSour1;
        oTarget = GetObjectByTag(sSour1);
    }
    else if (sSourceTag == sDest1)
    {
        sTarget = sSour1;
        oTarget = GetObjectByTag(sSour1);
    }
    else if (sSourceTag == sDest2)
    {
        sTarget = sSour2;
        oTarget = GetObjectByTag(sSour2);
    }
    else
    {
        sTarget = sTarget;
        oTarget = GetObjectByTag(sTarget);
    }

    // if its a standard mirror reflect the direction
    if (iMirror == 1)
    {
        //Debug("MIRROR sTag - " + sTag + ", sTarget - " + sTarget);

        if (iState == PUZ_OVERDRIVE)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXBurn, oSelf);
        }
        else
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXDeflect, oSelf);
        }

        // Decrement power on a mirror bounce to prevent from any infinite
        // projectile stacking
        iPowerLevel -= 1;
    }
    //if its a floor do a standard move
    else
    {
        //throw bouncing fireballs for the overdrive state
        if (iState == PUZ_OVERDRIVE)
        {
            AssignCommand(oSelf, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                eVFXExplode2, GetLocation(oSelf)));

            oDamaged = GetFirstObjectInShape(SHAPE_SPHERE, 4.0f,
                GetLocation(oSelf), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);

            // Deal damage
            while (oDamaged != OBJECT_INVALID)
            {
                eDamage = EffectDamage(d4(2) + 1 , DAMAGE_TYPE_FIRE, DAMAGE_POWER_PLUS_TWO);

                if ((oDamaged != oHench1) && (oDamaged != oHench2))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDamaged);
                }

                ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oDamaged);

                //if the target is smart and not the PC avoid the projectiles
                if ((GetIsPC(oDamaged) == FALSE)
                && (GetAbilityScore(oDamaged, ABILITY_INTELLIGENCE) > 10)
                && (GetAbilityScore(oDamaged, ABILITY_WISDOM) > 10))
                {
                    AssignCommand(oDamaged, ActionMoveAwayFromObject(oSelf, TRUE, 6.0f));
                }

                oDamaged = GetNextObjectInShape(SHAPE_SPHERE, 4.0f,
                    GetLocation(oSelf), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
            }
        }
        // Throw cool sonic spheres for regular play
        else
        {
            AssignCommand(oSelf, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                eVFXExplode1, GetLocation(oSelf)));

            oDamaged = GetFirstObjectInShape(SHAPE_SPHERE, 3.5f,
                GetLocation(oSelf), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);

            //deal non overdrive damage
            while (oDamaged != OBJECT_INVALID)
            {
                eDamage = EffectDamage(d6(1), DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_ONE);
                eStunned = EffectStunned();

                if ((oDamaged != oHench1) && (oDamaged != oHench2))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDamaged);
                }

                ApplyEffectToObject(DURATION_TYPE_INSTANT, eSonic, oDamaged);

                //if the target is smart and not the PC avoid the projectiles
                if ((GetIsPC(oDamaged) == FALSE)
                && (GetAbilityScore(oDamaged, ABILITY_INTELLIGENCE) > 10)
                && (GetAbilityScore(oDamaged, ABILITY_WISDOM) > 10))
                {
                    AssignCommand(oDamaged, ActionMoveAwayFromObject(oSelf, TRUE, 6.0f));
                }

                oDamaged = GetNextObjectInShape(SHAPE_SPHERE, 3.5f,
                    GetLocation(oSelf), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
            }
        }
    }

    // if the Projectile power is still live keep moving it down the line
    if((iPowerLevel > 0)&&(oTarget != OBJECT_INVALID)&&(sTarget!=""))
    {
        // Do a line of sight check for projectiles paths that
        // contain doors, if there is a door in the way target the door.
        if (GetLocalInt(oSelf, "LINEOFSIGHT") == 1)
        {
            // Debug("LINE OF SIGHT CHECK INITATING");
            if (LineOfSightObject(oSelf, oTarget) == FALSE)
            {
                oTemp = GetNearestObject(OBJECT_TYPE_DOOR, oSelf);
                // Debug("Failed Line of sight");

                if ((oTemp != OBJECT_INVALID)
                    && (GetDistanceBetween(oSelf, oTemp) < 10.0f)
                    && GetIsOpen(oTemp) == FALSE)
                {
                    oTarget = oTemp;
                }
            }
        }

        // use a delay based on the distance between caster and target
        fDelay = (GetDistanceBetween(oTarget, oSelf) * 0.089f) + 0.115;
        DelayCommand( fDelay, AssignCommand(oTarget, LaunchProjectile(oSelf, iDirection, iPowerLevel)));

        // use the correct projectile depending on the puzzle state.
        if (iState == PUZ_OVERDRIVE)
        {
            AssignCommand(oSelf,
                ActionCastFakeSpellAtLocation(SPELL_SHADES_FIREBALL,
                    GetLocation(oTarget), PROJECTILE_PATH_TYPE_BALLISTIC));
        }
        else
        {
            AssignCommand(oSelf,
                ActionCastFakeSpellAtLocation(SPELL_SCINTILLATING_SPHERE,
                    GetLocation(oTarget), PROJECTILE_PATH_TYPE_BALLISTIC));
        }
    }

}


