// area ud events:
// 101: focus on player and jump to next chapter

#include "x1_inc_cutscene"
#include "x0_i0_henchman"

int CUTSCENE_NUMBER  = 4;
float TIME_END = 20.0;

void Focus(object oPC)
{
    AssignCommand(oPC, ClearAllActions());

    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT4MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT4RUNNING", CUTSCENE_NUMBER);
    MusicBackgroundSetDelay(OBJECT_SELF, 0);
    MusicBackgroundChangeDay(OBJECT_SELF, 52);
    MusicBackgroundChangeNight(OBJECT_SELF, 52);
    MusicBackgroundPlay(OBJECT_SELF);
    AssignCommand(oPC, SetCameraFacing(135.0, 6.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP));

    CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPC, TRUE);
    object oPC = GetLocalObject(OBJECT_SELF, "FOCUS_PC");
    CutSetCamera(CUTSCENE_NUMBER, 0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(CUTSCENE_NUMBER, 4.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(CUTSCENE_NUMBER, 10.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_END, oPC, FALSE);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        object oPC = GetLocalObject(OBJECT_SELF, "FOCUS_PC");

        SetCampaignInt("dbPlayers", "DeekinStory", GetLocalInt(oPC, "XP1_Deekin_Story"), oPC);
        SetCampaignInt("dbPlayers", "DornaStory", GetLocalInt(oPC, "XP1_Dorna_Story"), oPC);
        SetCampaignInt("dbPlayers", "XanosStory", GetLocalInt(oPC, "XP1_Xanos_Story"), oPC);

        // Storing level-up status
        object oXanos = GetObjectByTag("x0_hen_xan");
        object oDorna = GetObjectByTag("x0_hen_dor");
        object oDeekin = GetObjectByTag("x0_hen_dee");
        SetCampaignInt("dbHenchmen", "XanosLevelStatus", GetLocalInt(oXanos, "X0_L_LEVELRULES"), oPC);
        SetCampaignInt("dbHenchmen", "DornaLevelStatus", GetLocalInt(oDorna, "X0_L_LEVELRULES"), oPC);
        SetCampaignInt("dbHenchmen", "DeekinLevelStatus", GetLocalInt(oDeekin, "X0_L_LEVELRULES"), oPC);

        Focus(oPC);
        StoreCampaignObject("dbGeneral", "MainPC", oPC);
        // store hired henchman for each player
        object oPlayer = GetFirstPC();
        while(oPlayer != OBJECT_INVALID)
        {
            object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayer);
            if(oHenchman != OBJECT_INVALID)
            {
                FireHenchman(oPlayer, oHenchman);
                StoreCampaignObject("dbPlayers", "Henchman", oHenchman, oPlayer);
            }
            oPlayer = GetNextPC();
        }
        DeleteCampaignVariable("dbHenchmen", "xp0_hen_xan");
        DeleteCampaignVariable("dbHenchmen", "xp0_hen_dor");
        DeleteCampaignVariable("dbHenchmen", "xp0_hen_dee");
        DelayCommand(TIME_END, StartNewModule("XP1-Chapter 2"));
    }
}
