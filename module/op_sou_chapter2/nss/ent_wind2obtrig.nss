//::///////////////////////////////////////////////
//:: Name ent_wind2obtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setup the Obelisk Firewhip effect the first time
    the trigger is entered.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 12/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nBeamSetUp") != 1)
    {
        //Pentagram beams
        SetLocalInt(OBJECT_SELF, "nBeamSetUp", 1);
        //obelisk beam effects
        object oObelisk1 = GetObjectByTag("winds02_ob_1_1");
        object oObelisk2 = GetObjectByTag("winds02_ob_1_2");
        object oObelisk3 = GetObjectByTag("winds02_ob_1_3");
        object oObelisk4 = GetObjectByTag("winds02_ob_1_4");
        object oClayGolem = GetObjectByTag("winds02_HelmHor");

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_FIRE_LASH, oObelisk1, BODY_NODE_CHEST), oClayGolem);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_FIRE_LASH, oObelisk2, BODY_NODE_CHEST), oClayGolem);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_FIRE_LASH, oObelisk3, BODY_NODE_CHEST), oClayGolem);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_FIRE_LASH, oObelisk4, BODY_NODE_CHEST), oClayGolem);

    }
}
