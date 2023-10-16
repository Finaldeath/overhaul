// Devil's army area user-defined events

int DEVIL_BUFFER = 15; // max number of devils on screen
int DEVIL_MAX = 80; // total number of devils to fight
//int DEVIL_COUNT; // current number of devils on screen
//int DEVIL_DEAD_COUNT; // total number of devil killed

int CUTSCENE_NUMBER = 778;

#include "x2_inc_cutscene"

void DebugStr(string sStr)
{
    //SendMessageToPC(GetFirstPC(), sStr);
    //AssignCommand(GetFirstPC(), SpeakString(sStr));
}

void BringDevil(location lLoc)
{
   int nTotalCreated = GetLocalInt(OBJECT_SELF, "YJ_TOTAL_CREATED");
   nTotalCreated++;
   DebugStr("BOOM Total= " + IntToString(nTotalCreated));
   SetLocalInt(OBJECT_SELF, "YJ_TOTAL_CREATED", nTotalCreated);
   if(nTotalCreated > DEVIL_MAX)
         return;
   effect eVis = EffectVisualEffect(VFX_IMP_HARM);
   ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);
   object oDevil = CreateObject(OBJECT_TYPE_CREATURE, "yj_devil", lLoc);
   object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oDevil);
   AssignCommand(oDevil, ActionAttack(oEnemy));

}

void BringBoss()
{
    object oSP = GetWaypointByTag("yj_wp_devil_final_sp");
    object oCamera1 = GetWaypointByTag("yj_wp_camera2");
    object oPC = GetFirstPC();
    object oPitFiend = GetObjectByTag("yj_pitfiend");
    object oCopySP = GetWaypointByTag("yj_wp_copy_sp");
    object oPCJump = GetWaypointByTag("yj_wp_pc_jump");

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_APPEAR_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_APPEAR_ONCE", 1);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutDisableAbort(CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oPitFiend, CUTSCENE_NUMBER);

    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutJumpToObject(1.0, oPC, oPCJump);
    CutSetLocation(0.2, oPC);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "yj_pc_copy2");
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutJumpToObject(0.0, oCopy, oPC);
    CutJumpToObject(0.2, oPC, oCamera1);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 16.0, 70.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 0.0, 90.0, CAMERA_TRANSITION_TYPE_MEDIUM);

    // bring in the big guy
    location lLoc;
    int i;
    vector vPos = GetPosition(oSP);
    float fDelay = 0.08;
    for(i = 1; i <= 26; i++)
    {
        vPos.z += 0.3;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        if(i == 10)
        {
            CutJumpToObject(0.0, oPitFiend, oSP);
        }
        CutApplyEffectAtLocation(fDelay, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_20, lLoc);
        //fDelay += 0.08;
    }
    // Feb 26, 2004: hacky symptomatic fix - makes sure the boss really did jump over
    DelayCommand(10.0, ExecuteScript("yj_jump_boss", oPitFiend));

    CutPlaySound(1.2, oPC, "c_devil_bat1");
    CutPlayAnimation(0.2, oPitFiend, ANIMATION_FIREFORGET_TAUNT, 0.0);
    CutFadeOutAndIn(3.0, oPC, 4.0);
    CutDisableCutscene(CUTSCENE_NUMBER, 0.5, 0.5);

    //ject oWP = GetNearestObjectByTag("yj_wp_devil_join", GetFirstPC(), 3);
    //effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    //AssignCommand(oPitFiend, ActionJumpToObject(oWP));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // a devil has died
    {
        DebugStr("BOOM Got Death Event");
        int nDeadCount = GetLocalInt(OBJECT_SELF, "YJ_DEAD_COUNT");
        int nDevilCount = GetLocalInt(OBJECT_SELF, "YJ_DEVILS_SCREEN_COUNT");
        nDeadCount++;
        nDevilCount--;
        SetLocalInt(OBJECT_SELF, "YJ_DEAD_COUNT", nDeadCount);
        SetLocalInt(OBJECT_SELF, "YJ_DEVILS_SCREEN_COUNT", nDevilCount);

    }
    else if(nEvent == 102) // heartbeat
    {
        if(GetLocalInt(OBJECT_SELF, "YJ_FIGHT_STARTED") == 0)
            return;

        object oPC = GetFirstPC();
        int nDeadCount = GetLocalInt(OBJECT_SELF, "YJ_DEAD_COUNT");
        DebugStr("BOOM Dead Count= " + IntToString(nDeadCount));
        if(nDeadCount >= DEVIL_MAX) // finish fight - bring the boss
        {
            SetLocalInt(OBJECT_SELF, "YJ_FIGHT_STARTED", 0);
            SetLocalInt(OBJECT_SELF, "DELAY_STATRED", 0);
            BringBoss();
            return;
        }
        int nTotalCreated = GetLocalInt(OBJECT_SELF, "YJ_TOTAL_CREATED");
        if(nTotalCreated >= DEVIL_MAX)
            return;
        DebugStr("BOOM Heartbeat Total Created= " + IntToString(nTotalCreated));
        int nDevilCount = GetLocalInt(OBJECT_SELF, "YJ_DEVILS_SCREEN_COUNT"); // current number on screen
        DebugStr("BOOM Heartbeat Screen Count= " + IntToString(nDevilCount));
        int nMaxCreate = DEVIL_MAX - nDeadCount; // max number to create
        int nCreateNum = DEVIL_BUFFER - nDevilCount;
        if(nCreateNum > nMaxCreate)
            nCreateNum = nMaxCreate;

        int i;
        object oWP;
        int nRand;
        float fDelay;

        nDevilCount += nCreateNum;
        SetLocalInt(OBJECT_SELF, "YJ_DEVILS_SCREEN_COUNT", nDevilCount);
         DebugStr("BOOM Heartbeat UPDATED Screen Count= " + IntToString(nDevilCount));
        //nTotalCreated += nCreateNum;
        //SetLocalInt(OBJECT_SELF, "YJ_TOTAL_CREATED", nTotalCreated);

        // creating the devils:
        for(i = 1; i <= nCreateNum; i++)
        {
            nRand = Random(10) + 1; // chooding a random waypoint to spawn.
            oWP = GetNearestObjectByTag("yj_wp_devil_join", oPC, nRand);
            DelayCommand(fDelay, BringDevil(GetLocation(oWP)));
            fDelay += 1.0;

        }

    }
}
