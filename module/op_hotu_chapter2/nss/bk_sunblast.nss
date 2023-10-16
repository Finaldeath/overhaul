//::///////////////////////////////////////////////
//:: bk_sunblast
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Unless you are capable of redirecting sunlight
    you get burned.

    requires 2 pods, bk_light, bk_light_3
    will spawn bk_light_2
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "x2_inc_sim"
#include "nw_i0_plot"


// * returns TRUE if character is considered
// * reflective
int GetReflective(object oEnter)
{
    // * if an eyeball, return true
    int nAppearance = GetAppearanceType(oEnter);
    if (nAppearance == 403 || nAppearance == 401 || nAppearance == 402 || nAppearance == 472)
    {
        // * This creature reflects the light with its eye, causing the shadow bridge to materialize
        AssignCommand(oEnter, SpeakStringByStrRef(84557));
        return TRUE;
    }
    else
    // has Halaster's glass
    if (GetIsObjectValid(GetItemPossessedBy(oEnter, "q2bmagglass")) == TRUE)
    {
        // * You use Halaster's magnifying glass to redirect the sunlight, causing the shadow bridge to materialize
        AssignCommand(oEnter, SpeakStringByStrRef(84558));
        return TRUE;
    }
    else
    if (sim_IsPuzzleCorrect() == TRUE)
    {
        return TRUE;
    }

    return FALSE;
}
location AdjustPosition(location lOriginal, float zOffset, float xOffset, float yOffset)
{
    vector vPos = GetPositionFromLocation(lOriginal);
    object oArea = GetAreaFromLocation(lOriginal);
    float fFace = GetFacingFromLocation(lOriginal);
    vPos.z = vPos.z + zOffset;
    vPos.x = vPos.x + xOffset;
    vPos.y = vPos.y + zOffset;

    return Location(oArea, vPos, fFace);
}


// * Make the pillar shrink into the ground
void DepressPillar()
{
    string sTag = "bk_light";
    string sResRef = "bk_light";
    object oPillar = GetNearestObjectByTag(sTag);
    object oPillar2 = GetNearestObjectByTag(sTag+"_2");
    object oPillar3 = GetNearestObjectByTag(sTag+"_3");
    // * remove the light effect
    //RemoveEffect(oPillar, GetFirstEffect(oPillar));
    //RemoveEffect(oPillar2, GetFirstEffect(oPillar));
    //RemoveEffect(oPillar3, GetFirstEffect(oPillar));

    //effect eVis = EffectVisualEffect(424);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oPillar);
    //DestroyObject(oPillar, 0.5);
}

void BridgeBurst()
{
    object oTarget = GetNearestObjectByTag("bk_target_sun");
    int i = 1;
    int nType = PROJECTILE_PATH_TYPE_BALLISTIC;
    for (i=1; i<= 100; i++)
    {
        location lLoc = GetLocation(GetNearestObjectByTag("bk_loc" + IntToString(Random(10) + 1)));
        if (Random(2) +1 > 1)
        {
            nType =PROJECTILE_PATH_TYPE_HOMING;
        }
        else
        {
            nType = PROJECTILE_PATH_TYPE_BALLISTIC;
        }
        DelayCommand(0.1 + IntToFloat(i) / 100, AssignCommand(oTarget, ActionCastFakeSpellAtLocation(781, lLoc, nType)));
    }

}


// * just a wrapper function so the beam creation could be delayed
void DelayRay(object oSource, int nBeam, int nNode, object oTarget)
{
    vector vPos = GetPosition(oTarget);
    vPos.z = 2.8;
    location lLoc = Location(GetArea(oTarget), vPos, 0.0);
    object oTarget2 = CreateObject(OBJECT_TYPE_PLACEABLE, "bk_inv_target", lLoc);
    effect eRay = EffectBeam(nBeam, oSource, nNode);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget2, 1.2);
}

void main()
{

    float OFFSET = 3.0;
    object oUser = GetPCSpeaker();

    object oTrigger = GetNearestObjectByTag("bk_sunlightrig");
    object oEnter = GetFirstInPersistentObject(oTrigger, OBJECT_TYPE_CREATURE);
    effect eLight = EffectVisualEffect(VFX_DUR_LIGHT_WHITE_10);

    object oTarget = oEnter; // * Target varies on whether someone reflective is standing here
    object oSource = GetNearestObjectByTag("bk_light");
    object oMirror = GetNearestObjectByTag("bk_mirror");
    object oEndDest = GetNearestObjectByTag("bk_target_sun"); // * oTarget changes to this if the target is reflective
    int nBeam = VFX_BEAM_FIRE;
    int nNode = BODY_NODE_HAND;

    AssignCommand(oSource, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    DelayCommand(6.0, AssignCommand(oSource, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));

    if (GetLocalInt(OBJECT_SELF, "X2_L_DONE") == 10)
    {
        return;

    }

    if (GetReflective(oEnter) == FALSE)
    {
        OFFSET = 0.1;
        // * do damage
        effect eRay = EffectBeam(nBeam, oSource, nNode);
        DelayCommand(OFFSET,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.2));

        // * impact
        effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
        DelayCommand(OFFSET,ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
        effect eDamage = EffectDamage(d10() * 10, DAMAGE_TYPE_FIRE);
        DelayCommand(OFFSET,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));

        // * user takes electrical shock
        effect eElectrical = EffectDamage(d100(), DAMAGE_TYPE_ELECTRICAL);
        effect eVis2 = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eElectrical, oUser);
        FloatingTextStrRefOnCreature(86676, oUser);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oUser);
        return;
    }
    else
    {
        PlaySound("as_mg_frstmagic4");
        object oArea = GetArea(OBJECT_SELF);
        AssignCommand(oArea, PlayCharacterTheme(49));
        Reward_2daXP(oUser, 56);

            SetLocalInt(OBJECT_SELF, "X2_L_DONE", 10);

        // * reflect sunlight in the position
        // * the character is facing

        effect eRay = EffectBeam(nBeam, oSource, nNode);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oSource);

        // * if you did the puzzle, substitute a new "puzzle" pod instead of the player
        object oNewPod;
        if (sim_IsPuzzleCorrect() == TRUE)
        {
            oNewPod = CreateObject(OBJECT_TYPE_PLACEABLE, "bk_light", GetLocation(GetNearestObjectByTag("bk_spawn_pod_here")), FALSE, "bk_light_2");
            // * delay necessary or action is lost
            DelayCommand(0.2, AssignCommand(oNewPod, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE)));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oNewPod));
            DelayCommand(OFFSET+6.0, AssignCommand(oNewPod, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
            oTarget = oNewPod;
        }
        DelayCommand(OFFSET, DelayRay(oSource, nBeam, nNode, oTarget));
        //DelayCommand(OFFSET, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.2));
        // * from source to creature

        // * from creature to end mirror
        DelayCommand(OFFSET+1.0, DelayRay(oTarget, nBeam, nNode, oMirror));
        // * make face mirror

        // * have mirror-pod extract
        DelayCommand(0.5, AssignCommand(oMirror, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE)));
        DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oMirror));
        DelayCommand(OFFSET + 6.2, AssignCommand(oMirror, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));

        AssignCommand(oTarget, ClearAllActions());
        vector vPosition = GetPositionFromLocation(GetLocation(oMirror));
        AssignCommand(oTarget, SetFacingPoint(vPosition));
        // * from mirror to end

        //eRay = EffectBeam(nBeam, oMirror, nNode);
        DelayCommand(OFFSET + 2.0, DelayRay(oMirror, nBeam, nNode, oEndDest));

        // make sure the player sees the bridge
        object oPC = oEnter;
        if(!GetIsPC(oPC))
            oPC = GetFirstPC();
        AssignCommand(oPC, StoreCameraFacing());
        AssignCommand(oPC, SetCameraFacing(70.0, 20.0, 65.0, CAMERA_TRANSITION_TYPE_VERY_FAST));
        AssignCommand(oPC, DelayCommand(OFFSET + 7.0, RestoreCameraFacing()));

        OFFSET += 1.5;
        DelayCommand(OFFSET +2.0, ExecuteScript("bk_invis_remove", OBJECT_SELF));


        DelayCommand(OFFSET +1.1, DepressPillar());
        DelayCommand(OFFSET +0.7, BridgeBurst());
        DelayCommand(OFFSET +1.2, BridgeBurst());
        DelayCommand(OFFSET +1.7, BridgeBurst());
        DelayCommand(OFFSET +2.5, BridgeBurst());

        SetLocalInt(GetModule(), "X2_BRIDGEAPPEARED", 10);
        // * destroy the message trigger that alerts the player to the shadow thing
        object oTrigger = GetNearestObjectByTag("bk_shadowbrd");
        if (GetIsObjectValid(oTrigger) == TRUE)
        {
            DestroyObject(oTrigger, OFFSET +0.1);
        }
        DelayCommand(10.0, AssignCommand(oArea, PlayOldTheme()));
    }
}
