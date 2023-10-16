// Dracolich dies and jumps to next body:
// Disappear effect
// START CUTSCENE
// freeze all creatures in area (except dracolich and camera pc)
// jump invisible player near body
// dracolich flies down near the body
// dracolich switches bodies
// END CUTSCENE

#include "x2_inc_cutscene"
#include "x0_i0_corpses"

int GLOW_TIMES = 30;
float GLOW_DUR = 1.0;

int CUTSCENE_NUMBER = 36;   // death cutscene
int CUTSCENE_NUMBER2 = 361; // revive cutscene

void Restore(object oBody);

void FreezeAll(object oPC, object oDraco)
{
    if(CutGetActiveCutsceneForObject(oPC) == CUTSCENE_NUMBER)
    {
        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, i);
        effect eHold = EffectCutsceneParalyze();
        while(oCreature != OBJECT_INVALID)
        {
            if(oCreature != oPC && oCreature != oDraco)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, oCreature);
            }
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, i);
        }
    }
}

void UnFreezeAll(object oPC, object oDraco)
{
        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, i);
        effect eHold = EffectCutsceneParalyze();
        effect eEff;
        while(oCreature != OBJECT_INVALID)
        {
            if(oCreature != oPC && oCreature != oDraco)
            {
                eEff = GetFirstEffect(oCreature);
                while(GetIsEffectValid(eEff))
                {
                    if( GetEffectCreator(eEff) == OBJECT_SELF)
                        RemoveEffect(oCreature, eEff);
                    eEff = GetNextEffect(oCreature);
                }
            }
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, i);
        }

}

void Glow(object oGlow)
{
    int i;
    float fDelay;
    effect eLight = EffectVisualEffect(VFX_DUR_LIGHT_RED_20);
    for(i = 1; i <= GLOW_TIMES; i++)
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLight, oGlow, GLOW_DUR));
        fDelay += GLOW_DUR;
    }
}


void JumpCutscene(object oDraco, object oBody)
{
    object oPC = GetLocalObject(GetArea(OBJECT_SELF), "CUTSCENE_PC");
    AdjustReputation(oPC, oDraco, 50);
    AdjustReputation(oDraco, oPC, 50);
    effect eVis = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    ClearAllActions();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oDraco);
    AssignCommand(oPC, PlaySound("c_dragnold_dead"));
    object oCorpse = CreateObject(OBJECT_TYPE_CREATURE, "q3_dracolich", GetLocation(oDraco));
    effect eDeath = EffectDeath();
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oCorpse));
    effect eGlow = EffectVisualEffect(VFX_DUR_PARALYZED);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlow, oBody, GLOW_TIMES * GLOW_DUR));

    object oJumpWP = GetNearestObjectByTag("q3d_wp_revive_jump", oBody);
    object oCamera = GetNearestObjectByTag("q3d_wp_camera_jump", oBody);
    //effect eJump = EffectDisappearAppear(GetLocation(oJumpWP));
    DelayCommand(2.0, SetImmortal(oDraco, FALSE));
    SetObjectIsDestroyable(oDraco, TRUE);
    effect eJump = EffectDisappear();
    object oWPCreate = GetObjectByTag("q3d_wp_copy_sp");
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, oDraco, 5.0);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetCutsceneMode(0.5, oPC, TRUE, FALSE, TRUE, TRUE);
    CutDisableCutscene(CUTSCENE_NUMBER, 3.0, 3.0);
    DelayCommand(1.5, AdjustReputation(oPC, oDraco, -100));
    DelayCommand(1.5, AdjustReputation(oDraco, oPC, -100));
    /*CutSetActiveCutsceneForObject(oDraco, CUTSCENE_NUMBER);
    CutSetCutsceneMode(2.5, oPC, TRUE, TRUE, TRUE, TRUE);
    CutSetLocation(2.5, oPC);
    FreezeAll(oPC, oDraco);
    CutDisableAbort(CUTSCENE_NUMBER);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oWPCreate), "cut31_pc_copy");
    location lLoc = GetLocation(oPC);
    CutFadeOutAndIn(2.4, oPC, 1.0);
    CutJumpToObject(2.6, oPC, oCamera); // player jumps to camera
    CutSetCamera(2.6, oPC, CAMERA_MODE_TOP_DOWN, GetFacing(oCamera), 15.0, 50.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutJumpToLocation(2.5, oCopy, lLoc); // copy replaces PC
    CutSetFacingPoint(4.0, oDraco, GetTag(oCamera));
    DelayCommand(6.0, Restore(oDraco, oBody));
    CutAdjustReputation(11.0, oPC, oBody, -50);
    CutAdjustReputation(11.0, oBody, oPC, -50);
    DelayCommand(12.0, UnFreezeAll(oPC, oBody));
    CutDisableCutscene(CUTSCENE_NUMBER, 12.0, 12.0);*/
}

// enteing cutscene mode to have the player see the cool effects
void Restore(object oBody)
{
    effect eVis2 = EffectVisualEffect(294);
    vector vPos = GetPosition(oBody);
    vPos.z -= 1.0;
    location lLoc = Location(OBJECT_SELF, vPos, 0.0);
    effect eVis3 = EffectVisualEffect(VFX_COM_UNLOAD_MODEL);
    effect eRes = EffectResurrection();
    effect eHeal = EffectHeal(1000);
    object oCopySP = GetWaypointByTag("q3d_wp_copy_sp");
    SetImmortal(oBody, TRUE);



    object oPC = GetFirstPC();
    if(GetArea(oPC) != GetArea(oBody)) // player is not the area when the dracolich revives
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, oBody);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oBody);
        return;
    }
    AdjustReputation(oPC, oBody, 50);
    AdjustReputation(oBody, oPC, 50);
    CutSetActiveCutscene(CUTSCENE_NUMBER2, CUT_DELAY_TYPE_CUMULATIVE);
    CutDisableAbort(CUTSCENE_NUMBER2);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER2, TRUE);
    CutSetActiveCutsceneForObject(oBody, CUTSCENE_NUMBER2);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "q3d_pc_copy");
    CutFadeOutAndIn(0.0, oPC, 2.0);
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_VERY_HIGH, TRUE, TRUE);
    CutSetLocation(0.0, oPC);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 30.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(0.0, oCopy, oPC);
    CutJumpToObject(1.0, oPC, oBody);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 30.0, 60.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutApplyEffectAtLocation(0.0, oPC, DURATION_TYPE_INSTANT, 488, GetLocation(oBody));
    CutApplyEffectAtLocation(5.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_BLINDDEAF, GetLocation(oBody));
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eRes, oBody);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eHeal, oBody);
    CutFadeOutAndIn(4.0, oPC, 2.0);
    CutAdjustReputation(1.0, oBody, oPC, -100);
    CutAdjustReputation(0.0, oPC, oBody, -100);
    CutDisableCutscene(CUTSCENE_NUMBER2, 0.0, 0.0);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // Revive body cutscene
    {
        object oDraco = GetLocalObject(GetArea(OBJECT_SELF), "CUTSCENE_DRACO");
        object oBody = GetNearestObjectByTag("q3d_skeleton", oDraco);
        JumpCutscene(oDraco, oBody);
        int i = 1;
        object oGlow = GetNearestObjectByTag("q3d_glow", oBody, i);

        while(oGlow != OBJECT_INVALID)
        {
            Glow(oGlow);
            i++;
            oGlow = GetNearestObjectByTag("q3d_glow", oBody, i);
        }
        object oPhyl = GetObjectByTag("q3d_phylactery");
        effect eGlow = EffectVisualEffect(VFX_DUR_PARALYZED);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlow, oPhyl, GLOW_TIMES * GLOW_DUR);
        DelayCommand(GLOW_TIMES * GLOW_DUR, Restore(oBody));
        object oSound = GetObjectByTag("q3d_sound1");
        SoundObjectPlay(oSound);
        DelayCommand(GLOW_TIMES * GLOW_DUR + 3.0, SoundObjectStop(oSound));
    }
    else if(nEvent == 103) // vfx at the pylactery's location
    {
        object oPhyl = GetObjectByTag("q3d_phylactery");
        location lLoc = GetLocation(oPhyl);
        effect eSoul = EffectVisualEffect(VFX_IMP_DEATH_L);
        DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSoul, lLoc));
    }
}
