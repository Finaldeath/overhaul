/* Katriana action taken: begin ambush cutscene
- short pause
- some stinger sounds are made from all three directions
- Torias comes running from the outlying area, displaying a string "We're under attack! It's an ambush!"
- Katriana: "Everyone arm yourselves!!"
- all the halflings should pull out their weapons
- Deekin and the other henchman should appear at one of the wagon entrances
- the attack begins, cut-scene ends
*/

#include "x1_inc_plot"
#include "nw_i0_generic"
#include "x1_inc_cutscene"

int CUTSCENE_NUMBER = 2;
float TIME_START = 1.5;
float TIME_EQUIP = TIME_START + 4.5;
float TIME_END = TIME_EQUIP + 3.5;

void PullWeapon(object oObject, int nRanged = FALSE)
{
    int nRand = d6(1);
    float fDelay = nRand * 0.5;
    if(nRanged == TRUE)
        DelayCommand(fDelay + TIME_EQUIP, AssignCommand(oObject, ActionEquipMostDamagingRanged()));
    else
        DelayCommand(fDelay + TIME_EQUIP, AssignCommand(oObject, ActionEquipMostDamagingMelee()));

    float fFace = IntToFloat(Random(360));
    DelayCommand(fDelay + TIME_EQUIP + 0.5, AssignCommand(oObject, SetFacing(fFace)));
    DelayCommand(fDelay + TIME_EQUIP + 0.5, AssignCommand(oObject, ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 2.0)));
}

void StartCutscene()
{
    object oPC = GetLocalObject(GetArea(OBJECT_SELF), "Q1_CUTSCENE_PC");
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_AMBUSH_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_AMBUSH_CUTSCENE_ONCE", 1);

    DelayCommand(TIME_END + 3.0, SetLocalInt(GetArea(OBJECT_SELF), "CUTSCENE_STARTED", 1)); // used in area-hb event

    AssignCommand(oPC, ClearAllActions());

    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT2MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT2RUNNING", CUTSCENE_NUMBER);

    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_START, oPC, TRUE, TRUE, TRUE);

    object oTorias = GetNearestObjectByTag("Q1_TORIAS");
    SetLocalInt(oTorias, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oKatriana = OBJECT_SELF;
    SetLocalInt(oKatriana, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oDeekin = GetObjectByTag("x0_hen_dee");
    SetLocalInt(oDeekin, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oOtherHenchman;

    object oDeekinWP = GetWaypointByTag("Q1_WP_DEEKIN_SP");
    object oOtherWP = GetWaypointByTag("Q1_WP_OTHER_SP");
    object oOtherWP2 = GetWaypointByTag("Q1_WP_OTHER_SP2");
    if(GetTag(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC)) == "x0_hen_dor")
        oOtherHenchman = GetObjectByTag("x0_hen_xan");
    else
        oOtherHenchman = GetObjectByTag("x0_hen_dor");
    object oOtherHenchman2 = GetObjectByTag("x0_hen_xan");
    SetLocalInt(oOtherHenchman, "nCutsceneNumber", CUTSCENE_NUMBER);

    object oHalfing1 = GetNearestObjectByTag("Q1_HALFING1");
    SetLocalInt(oHalfing1, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oHalfing2 = GetNearestObjectByTag("Q1_HALFING2");
    SetLocalInt(oHalfing2, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oHalfing3 = GetNearestObjectByTag("Q1_HALFING3");
    SetLocalInt(oHalfing3, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oBirgen = GetNearestObjectByTag("Q1_BIRGEN");
    SetLocalInt(oBirgen, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oFurten = GetNearestObjectByTag("Q1_FURTEN");
    SetLocalInt(oFurten, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    SetLocalInt(oZidan, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oSound1 = GetNearestObjectByTag("Q1_STINGER_SOUND1");
    object oSound2 = GetNearestObjectByTag("Q1_STINGER_SOUND2");
    object oSound3 = GetNearestObjectByTag("Q1_STINGER_SOUND3");

    DelayCommand(0.5, SoundObjectPlay(oSound1));
    DelayCommand(1.0, SoundObjectPlay(oSound2));
    DelayCommand(1.5, SoundObjectPlay(oSound3));


    CutActionMoveToObject(CUTSCENE_NUMBER, TIME_START + 1.0, oTorias, oKatriana, TRUE);
    DelayCommand(TIME_START + 1.0, MusicBackgroundStop(GetArea(OBJECT_SELF)));
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_START + 2.0, oTorias, 40503);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_START + 3.0, oTorias, ANIMATION_LOOPING_TALK_FORCEFUL, 2.0);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_START + 3.5, oKatriana, 40504);

    PullWeapon(oHalfing1);
    PullWeapon(oHalfing2);
    PullWeapon(oHalfing3);
    PullWeapon(oFurten);
    PullWeapon(oBirgen);
    PullWeapon(oZidan, TRUE);
    PullWeapon(oKatriana, TRUE);

    object oDoor = GetNearestObjectByTag("Q1_HENCH_DOOR");
    SetLocked(oDoor, FALSE);
    DelayCommand(TIME_EQUIP, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
    DelayCommand(TIME_EQUIP + 2.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
    DelayCommand(TIME_EQUIP + 2.5, SetLocked(oDoor, TRUE));
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_EQUIP + 1.0, oDeekin, GetLocation(oDeekinWP));
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_EQUIP + 1.0, oOtherHenchman, GetLocation(oOtherWP));
    if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC) == OBJECT_INVALID)
        CutJumpToLocation(CUTSCENE_NUMBER, TIME_EQUIP + 1.0, oOtherHenchman2, GetLocation(oOtherWP2));

    DelayCommand(TIME_END, ExecuteScript("q1_stinger_att", OBJECT_SELF));
    DelayCommand(TIME_END + 2.0, AssignCommand(oKatriana, DetermineCombatRound()));
    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_START + 3.5, oPC, FALSE);
}

void main()
{
    SetLocalObject(GetArea(OBJECT_SELF), "Q1_CUTSCENE_PC", GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q1_Katriana_Initial_Conv", 1);
    DelayCommand(1.0, StartCutscene());
}
