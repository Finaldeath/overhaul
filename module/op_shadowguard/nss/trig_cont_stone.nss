#include "help_hench"
#include "help_general"

// This handles the beam effects for the control stone.

void GlobeEffect(object oHark, object oAltar)
{
    if (GetLocalInt(GetModule(), "N_ST_1_HARK_FREED") == 0)
    {
        SetPlotFlag(oHark, FALSE);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oHark, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAltar, BODY_NODE_CHEST), oHark, 6.0);

        DelayCommand(0.5, SetPlotFlag(oHark, FALSE));

        DelayCommand(6.0, GlobeEffect(oHark, oAltar));
    }
}

void DoEnergyHums(object oAltar)
{

    object oSound = GetNearestObjectByTag("SOUND_CONT_STONE", oAltar);

    int nConstActivated = GetLocalInt(oAltar, "N_CONST_ACTIVATED");
    int nGateActivated = GetLocalInt(oAltar, "N_GATE_ACTIVATED");

    if (nConstActivated == 1)
    {
        int j;

        for (j = 0; j < 5; j++)
        {
            int nRand = Random(12) + 1;

            object oPedestal = GetNearestObjectByTag("PLAC_CONT_STONE_PED", oAltar, nRand);

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oAltar, BODY_NODE_CHEST), oPedestal, 3.0);
        }

        SoundObjectPlay(oSound);
    }

    if (nGateActivated == 1)
    {
        int i = 1;

        object oDoor = GetNearestObjectByTag("DOOR_GHAA_IMP_TREASURY");

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAltar, BODY_NODE_CHEST), oDoor, 3.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oDoor, 3.0);

        object oPedestal = GetNearestObjectByTag("PLAC_CONT_STONE_PED", oAltar, 1);

        while (oPedestal != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAltar, BODY_NODE_CHEST), oPedestal, 3.0);

            i++;

            oPedestal = GetNearestObjectByTag("PLAC_CONT_STONE_PED", oAltar, i);
        }

        SoundObjectPlay(oSound);
    }

    if (nConstActivated == 0 && nGateActivated == 0)
        SoundObjectStop(oSound);

    DelayCommand(3.0, DoEnergyHums(oAltar));
}

void main()
{
    object oPC = GetEnteringObject();

    SetLocalInt(oPC, "N_INSIDE_CSTONE_TRIG", 1);

    if (GetIsPC(oPC))
    {
        object oAltar = GetNearestObjectByTag("PLAC_GHAA_CONT_STONE");

        if (GetFirstTimeIn())
        {
            object oLight = GetNearestObjectByTag("PLAC_LIGHT", oAltar);

            AssignCommand(oLight, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

            DelayCommand(0.2, SetPlaceableIllumination(oLight, TRUE));
            DelayCommand(0.4, RecomputeStaticLighting(GetArea(OBJECT_SELF)));

            SetLocalInt(oAltar, "N_GATE_ACTIVATED", GetLocalInt(GetModule(), "N_MODULE_STAGE"));

            SetLocalInt(oAltar, "N_CONST_ACTIVATED", 1);

            DoEnergyHums(oAltar);

            object oHark = GetNearestObjectByTag("CT_UNIQ_SH_HARK", oPC);

            if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
            {
                SceneSpeak(oPC, "[The Control Room chamber appears to be quiet... too quiet.  You see the dead body of High Sorcerer Zhiram lying near the center of the room, as well as a man trapped in some sort of magical field.]");

                if (GetArea(oHark) == GetArea(oPC))
                {
                    GlobeEffect(oHark, oAltar);
                }
            }
        }

        if (GetArea(oAltar) == GetArea(oPC) && GetLocalInt(GetModule(), "N_CSTONE_DESTROY") == 1)
        {
            SetPlotFlag(oAltar, FALSE);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oAltar);
        }
    }

    else if (GetTag(oPC) == "CT_UNIQ_NT_CRIM")
    {
        object oCrim = oPC;

        oPC = GetFirstPC();

        SceneSpeak(oCrim, "Oh, I do not believe anyone is leaving this chamber...  [The Crimson Prophet makes a short gesture with his hand, and you find yourself frozen in place.]");

        object oDoor;

        int i;

        SetCommandable(TRUE, oPC);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), oPC);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectStunned(), oPC);

        object oHark = GetNearestObjectByTag("CT_UNIQ_SH_HARK", oPC);

        SetPlotFlag(oHark, FALSE);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), oHark);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectStunned(), oHark);

        DelayCommand(1.0, SetPlotFlag(oHark, TRUE));

        DelayCommand(1.5, AssignCommand(oCrim, ActionStartConversation(oPC)));
    }
}
