// On-enter for dracolich area (appear cutscene)

#include "x2_inc_cutscene"
#include "x0_i0_corpses"
#include "x0_i0_henchman"

int CUTSCENE_NUMBER = 35;

void CallPlaySoundObject(int nCutscene, object oPC, object oSound)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        AssignCommand(oPC, SoundObjectPlay(oSound));
    }
}

void CutPlaySoundObject(float fDelay, object oPC, object oSound)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallPlaySoundObject(nCutscene, oPC, oSound));
}

int GetNumPlayers()
{
    int n = 0;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        n++;
        oPC = GetNextPC();
    }
    return n;
}

void CreateGolems()
{
    int nNumPlayers = GetNumPlayers();
    int nGolemsNum = nNumPlayers + 1;
    int i;
    object oWP;
    object oGolem;
    for(i = 1; i <= nGolemsNum; i++)
    {
        oWP = GetObjectByTag("q3d_wp_golem_sp", i);
        oGolem = CreateObject(OBJECT_TYPE_CREATURE, "q3d_golem", GetLocation(oWP));
    }
}

/*void CreateSkeletons(object oDraco)
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SKELETONS_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SKELETONS_ONCE", 1);

    //object oDraco = GetObjectByTag("q3_vixthra");
    int i = 0;
    object oWP = GetObjectByTag("q3d_wp_skeleton_sp", i);
    object oSkeleton;
    while(oWP != OBJECT_INVALID)
    {
        oSkeleton = CopyObject(oDraco, GetLocation(oWP), OBJECT_INVALID, "q3_copy_vixthra");
        SetImmortal(oSkeleton, FALSE);
        KillAndReplaceDecorative(oSkeleton);
        i++;
        oWP = GetObjectByTag("q3d_wp_skeleton_sp", i);
    }
}*/


// re-hire deva if she was hired before
void CheckDeva(object oPC)
{
    object oDeva = GetNearestObjectByTag("q3c_Lavoera", oPC);
    if(oDeva != OBJECT_INVALID && GetLocalInt(oDeva, "X2_JUST_A_FOLLOWER") == TRUE
        && GetMaster(oDeva) == OBJECT_INVALID)
    {
        AddHenchman(oPC, oDeva);
        SetIsFollower(oDeva, TRUE);
        SetLocalInt(oDeva, "X2_JUST_A_FOLLOWER", TRUE);
    }
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    //CreateSkeletons(oDraco);
    CheckDeva(oPC);
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    DelayCommand(2.0, CreateGolems());
    // Handle player's created golems from the previous area
    effect eHold = EffectCutsceneParalyze();

    string sRoarSoundString1 = "c_dragnold_bat2";
    string sRoarSoundString2 = "c_dragnold_bat1";
    object oDraco = GetObjectByTag("q3_vixthra");
    DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "COMBAT_STARTED", 1));
    object oCamera1 = GetObjectByTag("q3d_wp_camera1");
    object oCamera2 = GetObjectByTag("q3d_wp_camera2");
    object oWPCreate = GetObjectByTag("q3d_wp_copy_sp");
    object oWPAppear = GetObjectByTag("q3d_wp_appear");
    object oSound1 = GetObjectByTag("q3_snd_rocks");
    object oSound2 = GetObjectByTag("q3_snd_dragon");
    DelayCommand(4.0, SoundObjectPlay(oSound1));

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oDraco, CUTSCENE_NUMBER);
    //CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oDraco);
    CutFadeOutAndIn(0.0, oPC, 4.0);
    object oGolem = GetFirstObjectInArea(OBJECT_SELF);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oWPCreate), "cut31_pc_copy");
    while(oGolem != OBJECT_INVALID)
    {
        if(GetTag(oGolem) == "q3c_GolemServant")
        {
            CutSetActiveCutsceneForObject(oGolem, CUTSCENE_NUMBER);
            CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, eHold, oGolem);
        }
        oGolem = GetNextObjectInArea(OBJECT_SELF);
    }
    CutSetCutsceneMode(2.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutSetLocation(0.0, oPC);
    CutSetCameraSpeed(0.3, oPC, 0.3);
    CutJumpToLocation(0.5, oCopy, GetLocation(oPC));
    CutJumpToObject(0.0, oPC, oCamera1);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 18.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1.5, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 9.0, 90.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutActionMoveToObject(0.0, oPC, oCamera2, FALSE);
    CutPlaySoundObject(1.5, oPC, oSound1);
    CutPlaySoundObject(4.5, oPC, oSound2);
    //CutPlaySound(6.0, oCopy, sRoarSoundString1);
    effect eJump = EffectDisappearAppear(GetLocation(oWPAppear));
    CutApplyEffectToObject2(3.0, DURATION_TYPE_TEMPORARY, eJump, oDraco, 2.0);
    CutApplyEffectAtLocation(3.7, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oPC));
    CutPlaySound(0.0, oPC, "bf_huge");
    CutApplyEffectAtLocation(0.0, oPC, DURATION_TYPE_INSTANT, 460, GetLocation(oWPAppear));
    int i = 1;
    /*object oDust = GetObjectByTag("q3d_wp_dust", i);
    while(oDust != OBJECT_INVALID)
    {
        CutApplyEffectAtLocation(0.0, oPC, DURATION_TYPE_INSTANT, 354, GetLocation(oDust));
        i++;
        oDust = GetObjectByTag("q3d_wp_dust", i);
    }*/
    CutPlayAnimation(2.0, oDraco, ANIMATION_LOOPING_CONJURE1, 3.0);
    CutPlaySound(1.0, oPC, sRoarSoundString2);
    CutAdjustReputation(4.0, oPC, oDraco, -100);
    CutAdjustReputation(0.0, oDraco, oPC, -100);
    CutFadeOutAndIn(0.0, oPC, 4.0);
    oGolem = GetFirstObjectInArea(OBJECT_SELF);
    while(oGolem != OBJECT_INVALID)
    {
        if(GetTag(oGolem) == "q3c_GolemServant")
        {
            CutRemoveEffects(0.0, oGolem);
        }
        oGolem = GetNextObjectInArea(OBJECT_SELF);
    }
    CutDisableCutscene(CUTSCENE_NUMBER, 2.0, 2.0, RESTORE_TYPE_NORMAL);
}
