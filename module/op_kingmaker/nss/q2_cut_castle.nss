//::///////////////////////////////////////////////
//:: q2ca_castle_ent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Feran should be in office.
     Starts cutscene if at endgame
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
// Generic function. Done to show how to make your own functions.
void GenericFunction(int iCut, object oPC);

void SetCampaignDataBase();

void main()
{
    object oFeran = GetObjectByTag("q2_feran");
    object oOffice = GetObjectByTag("q2ca_feran_office");
    object oPC = GetFirstPC();
    if (GetEnteringObject()==oPC)
    {
        object oEllysia = GetObjectByTag("q2_ellysia");
        if(GetIsDay()
            && GetIsObjectValid(oFeran)
            && GetLocalInt(GetModule(), "OS_FERANLOVE")!=60)
        {
            AssignCommand(oFeran,ActionJumpToObject(oOffice));
            SetLocalInt(oFeran,"OS_FERANATBAR",0);
        }
        if(GetLocalInt(oPC,"OS_MOMMA_END")>0)
        {
            int iCut = 40;
            if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
            {
                object oEnd1 = GetObjectByTag("ED_TauntingMen");
                object oEnd2 = GetObjectByTag("ED_TauntingWomen");
                object oEnd3 = GetObjectByTag("ED_TauntsNobleGroup");

                object oStart1 = GetObjectByTag("ED_CheersCommonerGroup");
                object oStart2 = GetObjectByTag("ED_CheersNobleGroup");
                object oStart3 = GetObjectByTag("ED_CheersWomenOutside");

                // End the booing and start the cheering!
                SoundObjectStop(oEnd1);
                SoundObjectStop(oEnd2);
                SoundObjectStop(oEnd3);

                SoundObjectPlay(oStart1);
                SoundObjectPlay(oStart2);
                SoundObjectPlay(oStart3);

                // Immediately blacks out screen. Fade in when the scene starts.
                BlackScreen(oPC);
                SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

                // Do any pre-cutscene stuff here.
                SetCampaignDataBase();

                // Start the scene.
                StartCutscene(oPC, iCut);
                DelayCommand(24.0,EndGame("dd_km_credits"));
            }
        }
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.

    //if the PC has accepted Mommaji's help
    if(GetLocalInt(oPC,"OS_MOMMA_END")==10)
    {
        location lDead1 = GetLocation(GetObjectByTag("q2_way_tundead1"));
        location lDead2 = GetLocation(GetObjectByTag("q2_way_tundead2"));
        object oDead1 = CreateObject(OBJECT_TYPE_CREATURE,"q2_tundead1",lDead1);
        object oDead2 = CreateObject(OBJECT_TYPE_CREATURE,"q2_tundead2",lDead2);
    }
    //other candidates
    object oMod = GetModule();
    object oBecket = GetObjectByTag("q2_sirbecket");
    object oEnivid = GetObjectByTag("q2_enivid");
    if(GetLocalInt(oMod,"OS_PC_LORD") == 50)
    {
        if(GetIsObjectValid(oBecket))
        {
            object oWayBeck = GetObjectByTag("q2_way_tbecket");
            CutSetActiveCutsceneForObject(oBecket, iCut);
            AssignCommand(oBecket,ActionJumpToObject(oWayBeck));

        }
        if(GetIsObjectValid(oEnivid))
        {
            object oWayEniv = GetObjectByTag("q2_way_tenivid");
            CutSetActiveCutsceneForObject(oEnivid, iCut);
            AssignCommand(oEnivid,ActionJumpToObject(oWayEniv));
        }
    }
    else
    {
        if(GetIsObjectValid(oBecket))
        {
            DestroyObject(oBecket);
        }
        if(GetIsObjectValid(oEnivid))
        {
            DestroyObject(oEnivid);
        }
    }
    object oAlias = GetObjectByTag("q2_alias");
    object oWayAlias = GetObjectByTag("q2_way_talias");
    CutSetActiveCutsceneForObject(oAlias, iCut);
    AssignCommand(oAlias,ActionJumpToObject(oWayAlias));

    //1 militia guild
    object oFeran = GetObjectByTag("q2_feran");
    if(GetIsObjectValid(oFeran))
    {
        object oWayFeran = GetObjectByTag("q2_way_tferan");
        CutSetActiveCutsceneForObject(oFeran, iCut);
        AssignCommand(oFeran,ActionJumpToObject(oWayFeran));
    }
    //2 trades guild
    object oGord = GetObjectByTag("q2_thegord");
    object oWayGord = GetObjectByTag("q2_way_tgord");
    CutSetActiveCutsceneForObject(oGord, iCut);
    AssignCommand(oGord,ActionJumpToObject(oWayGord));

    //3 temple guild
    object oDyns = GetObjectByTag("q2_dynschall");
    object oWayDyns = GetObjectByTag("q2_way_tdyns");
    CutSetActiveCutsceneForObject(oDyns, iCut);
    AssignCommand(oDyns,ActionJumpToObject(oWayDyns));

    //4 nobles guild
    object oElly = GetObjectByTag("q2_ellysia");
    object oWayElly = GetObjectByTag("q2_way_tellysia");
    CutSetActiveCutsceneForObject(oElly, iCut);
    AssignCommand(oElly,ActionJumpToObject(oWayElly));

    //5 Forestry Guild
    object oLevi = GetObjectByTag("q2_leviosa");
    object oWayLevi = GetObjectByTag("q2_way_tleviosa");
    CutSetActiveCutsceneForObject(oLevi, iCut);
    AssignCommand(oLevi,ActionJumpToObject(oWayLevi));

    //6 Thieves' Guild
    object oSouth = GetObjectByTag("q2_southpaw");
    object oWaySouth = GetObjectByTag("q2_way_tsouth");
    CutSetActiveCutsceneForObject(oSouth, iCut);
    AssignCommand(oSouth,ActionJumpToObject(oWaySouth));

    //7 landowner's guild
    object oSerah = GetObjectByTag("q2_serah");
    object oWaySerah = GetObjectByTag("q2_way_tserah");
    CutSetActiveCutsceneForObject(oSerah, iCut);
    AssignCommand(oSerah,ActionJumpToObject(oWaySerah));

    //8 mage guild
    object oYenna = GetObjectByTag("q2_yenna");
    object oWayYenna = GetObjectByTag("q2_way_tyenna");
    CutSetActiveCutsceneForObject(oYenna, iCut);
    AssignCommand(oYenna,ActionJumpToObject(oWayYenna));

    //9 merchant's guild
    object oGelani = GetObjectByTag("q2_gelani");
    object oThad = GetObjectByTag("q2_thaddeus");
    object oWayMerch = GetObjectByTag("q2_way_tmerchant");
    if(GetIsObjectValid(oGelani)
        && GetLocalInt(GetModule(), "OS_HELPGELANI")==99)
    {
        CutSetActiveCutsceneForObject(oGelani, iCut);
        AssignCommand(oGelani,ActionJumpToObject(oWayMerch));
    }
    else if(GetIsObjectValid(oThad))
    {
        CutSetActiveCutsceneForObject(oThad, iCut);
        AssignCommand(oThad,ActionJumpToObject(oWayMerch));
    }

    // PC Copy. Uncomment if needed. Define the loc where you want to create it.
    location lLoc = GetLocation(GetObjectByTag("q2_way_tcopy"));
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "OS_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);

    // Waypoint for start. Good idea to jump the PC to where you want at the start.
    location lPCStart = GetLocation(GetObjectByTag("q2_way_tpc"));
    location lPCEnd = GetLocation(GetObjectByTag("q2_way_tpc2"));

    /////////////////////////////////////////////////////////

    //
    // Setup the cutscene. Times should stay. Read function comments for more details.
    //
    CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_LOW, TRUE, 2);

    // Starting camera.
    // Adjust the camera how you see fit. Best to do a snap here while screen
    // is black to get your "starting" camera.
    CutJumpToLocation(2.0, oPC, lPCStart);
    CutSetCamera(2.3, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.0, 75.0,
        CAMERA_TRANSITION_TYPE_SNAP);


    // Fade in so we can start the scene.
    CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

    // Start the scene.
    // This is where all your action takes place. Do PC movements, spells, dialog,
    // fighting, camera movements, etc, here.
    CutPlayAnimation(6.0,oPCCopy,ANIMATION_LOOPING_SIT_CHAIR,16.0);

    CutActionMoveToLocation(9.0, oPC, lPCEnd, FALSE);
    CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 15.0, 75.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    if(GetIsObjectValid(GetNearestObjectByTag("q2_sirbecket")))
    {
        CutPlayAnimation(18.0,oBecket,ANIMATION_FIREFORGET_VICTORY3,1.0);
    }
    if(GetIsObjectValid(GetNearestObjectByTag("q2_enivid")))
    {
        CutPlayAnimation(18.0,oEnivid,ANIMATION_FIREFORGET_VICTORY1,1.0);
    }

    CutPlayAnimation(18.0,oAlias,ANIMATION_FIREFORGET_VICTORY2,1.0);

    if(GetIsObjectValid(GetNearestObjectByTag("q2_feran")))
    {
        CutPlayAnimation(18.0,oFeran,ANIMATION_FIREFORGET_VICTORY3,1.0);
    }
    CutPlayAnimation(18.0,oGord,ANIMATION_FIREFORGET_VICTORY1,1.0);
    CutPlayAnimation(18.0,oDyns,ANIMATION_FIREFORGET_VICTORY2,1.0);
    CutPlayAnimation(18.0,oElly,ANIMATION_FIREFORGET_VICTORY3,1.0);
    CutPlayAnimation(18.0,oLevi,ANIMATION_FIREFORGET_VICTORY1,1.0);
    CutPlayAnimation(18.0,oSouth,ANIMATION_FIREFORGET_VICTORY2,1.0);
    CutPlayAnimation(18.0,oSerah,ANIMATION_FIREFORGET_VICTORY3,1.0);
    CutPlayAnimation(18.0,oYenna,ANIMATION_FIREFORGET_VICTORY1,1.0);
    if(GetIsObjectValid(GetNearestObjectByTag("q2_gelani")))
    {
        CutPlayAnimation(18.0,oGelani,ANIMATION_FIREFORGET_VICTORY2,1.0);
    }
    else if(GetIsObjectValid(GetNearestObjectByTag("q2_thaddeus")))
    {
        CutPlayAnimation(18.0,oThad,ANIMATION_FIREFORGET_VICTORY3,1.0);
    }

    // End scene. Change times and parameters accordingly.
    // What should stay: The time difference between Fade and Disable, and the
    // fade length (1.5). These produce the best results.
    CutFadeToBlack(22.0, oPC);
    CutJumpToLocation(22.0, oPC, lLoc);
    CutDisableCutscene(iCut, 22.5, 22.5, RESTORE_TYPE_NONE);
    //destroy PC Copy
    CutDestroyPCCopy(22.5,oPC,FALSE);

}

// Change to be whatever you need.
void GenericFunction(int iCut, object oPC)
{
    // oPC is whatever object you need this function for. Change accordingly.
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
    // Insert function here.
    }
}

void SetCampaignDataBase()
{
    string sCampaign = "km010101_" + ObjectToString(GetFirstPC());

    // 10 - chosen, 99/0 means not chosen
    SetCampaignInt(sCampaign, "Q3AI_CAL_CHOSEN", GetLocalInt(GetFirstPC(), "Q3AI_CAL_CHOSEN"));
    SetCampaignInt(sCampaign, "Q3AI_JAB_CHOSEN", GetLocalInt(GetFirstPC(), "Q3AI_JAB_CHOSEN"));
    SetCampaignInt(sCampaign, "Q3AI_KAI_CHOSEN", GetLocalInt(GetFirstPC(), "Q3AI_KAI_CHOSEN"));
    SetCampaignInt(sCampaign, "Q3AI_TRP_CHOSEN", GetLocalInt(GetFirstPC(), "Q3AI_TRP_CHOSEN"));

    // 50 - PC won election, 60 - Enivid won, 70 - Becket won
    SetCampaignInt(sCampaign, "OS_PC_LORD", GetLocalInt(GetModule(), "OS_PC_LORD"));

    // 10 = The PC chooses to hunt alone
    // 20 = The PC sends just a few elite troops
    // 30 = The PC sends all the troops
    SetCampaignInt(sCampaign, "OS_ENIVID_DEPLOY", GetLocalInt(GetModule(), "OS_ENIVID_DEPLOY"));

    // Which god does the PC follow ?
    // 10 = Pharos
    // 20 = Mistress Death
    // 30 = Callahi
    // 40 = Veragok
    // 50 = Churl
    // 60 = Rictos
    // 70 = Suhili
    // 80 = Jaess
    // 90 = Tamose
    SetCampaignInt(sCampaign, "os_pcbelieves", GetLocalInt(GetFirstPC(), "os_pcbelieves"));

    // 10 = Sets that the player was asked to join the temple
    // 20 = Sets that the player has been given the first quest
    // 23 = The PC has fed the beggars
    // 27 = The PC extorted gold from the beggars
    // 30 = Sets that the player has been given the second quest
    // 32 = Gullford gave a donation to the temple
    // 34 = Gullford worships at the temple
    // 40 = Sets that the player is ready for the third quest
    // 50 = Sets that the PC has joined the temple
    // 80 = The PC has failed his quest to join the temple
    SetCampaignInt(sCampaign, "os_jointemple_pc", GetLocalInt(GetFirstPC(), "os_jointemple_pc"));

    // 40 = Only one priest supports the PC (The priestess of death)
    // 50 = Two priests support the PC.
    // 60 = The temple guild supports the PC
    // 70 = Dynschall dislikes the PC, but the PC can still win his vote
    // 80 = Dynschall dislikes the PC and the PC cannot win his vote
    // 100 = The temple guild supports the PC
    SetCampaignInt(sCampaign, "os_jointemple_pc", GetLocalInt(GetFirstPC(), "os_jointemple_pc"));

    // 99 = Dynschall hates the PC
    SetCampaignInt(sCampaign, "os_dynschallmet", GetLocalInt(GetFirstPC(), "os_jointemple_pc"));

    // 1 = The pc has asked for gold
    SetCampaignInt(sCampaign, "os_askedforgold", GetLocalInt(GetFirstPC(), "os_askedforgold"));

    // 30 = The election is over
    SetCampaignInt(sCampaign, "os_electionstatus", GetLocalInt(GetFirstPC(), "os_electionstatus"));

    // 10 = Yenna has told the player about Zebulon
    // 20 = Zebulon has been returned
    // 30 = Zebulon's reward has been given
    SetCampaignInt(sCampaign, "OS_YENNA_ZEBULON", GetLocalInt(GetModule(), "OS_YENNA_ZEBULON"));

    // 10 = The PC has the mage guild vote
    SetCampaignInt(sCampaign, "OS_MAGEGUILD_PC", GetLocalInt(GetFirstPC(), "OS_MAGEGUILD_PC"));

    // 10 = You have sold a fish to the beggar
    // 20 = You have given a fish to the beggar
    // 30 = You have given money to the beggar
    SetCampaignInt(sCampaign, "OS_BEGGAR_FISH", GetLocalInt(GetModule(), "OS_BEGGAR_FISH"));

    // 10 = The PC has NPCs vote
    SetCampaignInt(sCampaign, "OS_RAFAEL_VOTE", GetLocalInt(GetModule(), "OS_RAFAEL_VOTE"));
    SetCampaignInt(sCampaign, "OS_LAVOS_VOTE", GetLocalInt(GetModule(), "OS_LAVOS_VOTE"));

    // 10 = PC has heard about goblin caves
    // 20 = Alias has taken the PC to the goblin caves
    // 30 = PC has cleared out goblin caves
    // 99 = PC has collected reward
    SetCampaignInt(sCampaign, "os_serahcaves", GetLocalInt(GetFirstPC(), "os_serahcaves"));

    // 10 = The PC has the landowners' guild vote
    SetCampaignInt(sCampaign, "OS_LANDGUILD_PC", GetLocalInt(GetFirstPC(), "OS_LANDGUILD_PC"));

    // 10 = The PC has heard about the haunted house
    // 20 = The haunted house is sold
    // 30 = Lavos has performed an exorcism on the house
    // 40 = The ghost left due to resolution of the Feran ellysia plot
    SetCampaignInt(sCampaign, "OS_SERAH_HOMESOLD", GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD"));

    // 10 = Thaddeus has told the story of Gelani
    SetCampaignInt(sCampaign, "OS_THADDEUS_STORY", GetLocalInt(GetModule(), "OS_THADDEUS_STORY"));

    // 10 = PC has the merchant guild's vote
    SetCampaignInt(sCampaign, "OS_MERCHGUILD_PC", GetLocalInt(GetFirstPC(), "OS_THADDEUS_STORY"));

    // 10 = PC asked to kill Gelani by Thaddeus
    // 15 = PC has lured Gelani away.
    // 20 = PC killed Gelani
    // 99 = PC rewarded
    SetCampaignInt(sCampaign, "OS_KILLGELANI", GetLocalInt(GetModule(), "OS_KILLGELANI"));

    // 10 = PC agreed to kill Typhus
    // 15 = The PC killed Typhus
    // 20 = PC killed Typhus & Rewarded
    // 30 = Thaddeus not voting for PC
    SetCampaignInt(sCampaign, "OS_KILLTYPHUS", GetLocalInt(GetModule(), "OS_KILLTYPHUS"));

    // 10 = PC is a known assassin
    SetCampaignInt(sCampaign, "OS_PC_ASSASSIN", GetLocalInt(GetFirstPC(), "OS_THADDEUS_STORY"));

    // 10 = The PC knows about the quarrel with Thaddeus
    // 99 = Gelani is now Merchant Guildmaster
    SetCampaignInt(sCampaign, "OS_HELPGELANI", GetLocalInt(GetModule(), "OS_HELPGELANI"));

    // 10 = The PC tried to persuade Gelani to go against Thaddeus
    SetCampaignInt(sCampaign, "OS_PERSUADEGELANI", GetLocalInt(GetModule(), "OS_PERSUADEGELANI"));

    // 10 = The PC tried to bluff Gelani to go against Thaddeus
    SetCampaignInt(sCampaign, "OS_BLUFFGELANI", GetLocalInt(GetModule(), "OS_BLUFFGELANI"));

    // 10 = The PC tried to intimidate Gelani to go against Thaddeus
    SetCampaignInt(sCampaign, "OS_INTIMIDATEGELANI", GetLocalInt(GetModule(), "OS_INTIMIDATEGELANI"));

    // 10 = PC knows something is wrong with mead
    // 15 = PC has agreed to look in hives
    // 20 = PC found poisoned blade
    // 30 = PC helping Hermit sell honey
    // 40 = PC gets Alias to help Hermit
    // 50 = PC gets Alias to kill Hermit
    // 60 = PC kills Hermit
    // 99 = Hermit quest over
    SetCampaignInt(sCampaign, "OS_HELPDRUID", GetLocalInt(GetFirstPC(), "OS_HELPDRUID"));

    // 10 = The hermit has been told about giving the dagger to Garrot
    SetCampaignInt(sCampaign, "OS_DAGGER_TOLD", GetLocalInt(GetModule(), "OS_BLUFFGELANI"));

    // 10 = The druid has already paid the pc once
    SetCampaignInt(sCampaign, "OS_DRUIDPAID", GetLocalInt(GetModule(), "OS_DRUIDPAID"));

    // 10 = PC Knows about Manticore Hunt
    // 15 = Trap recreated
    // 20 = PC Killed w/o trap
    // 30 = PC Killed with trap
    // 80 = PC reported failure
    // 99 = PC reported success / rewarded
    SetCampaignInt(sCampaign, "os_manticorehunt", GetLocalInt(GetModule(), "os_manticorehunt"));

    // 1 = PC joined
    // 2 = PC heard about it, but didn't join
    SetCampaignInt(sCampaign, "os_pcjoinedforesters", GetLocalInt(GetFirstPC(), "os_pcjoinedforesters"));

    // 10 = PC has Military Guild vote
    SetCampaignInt(sCampaign, "OS_MILITARYGUILD", GetLocalInt(GetFirstPC(), "OS_MILITARYGUILD"));

    // 10 = Ellysia told
    // 20 = Ellysia loves Feran and wants him back
    // 30 = Ellysia forgives Feran
    // 40 = Elly hates Feran
    // 60 = You've told Feran that Ellysia loves him. (House no longer haunted)
    SetCampaignInt(sCampaign, "OS_FERANLOVE", GetLocalInt(GetModule(), "OS_FERANLOVE"));

    // 10 = Kaidala thinks the PC likes women
    SetCampaignInt(sCampaign, "os_kaidalafemale", GetLocalInt(GetFirstPC(), "os_kaidalafemale"));

    // 10 = The PC knows about Becket's affair
    // 20 = The PC has told Ellysia about the affair and she believes
    // 30 = Ellysia does not believe you
    SetCampaignInt(sCampaign, "OS_BECKET_AFFAIR", GetLocalInt(GetFirstPC(), "OS_BECKET_AFFAIR"));

    // 10 = The nobles are voting for the pc
    SetCampaignInt(sCampaign, "OS_NOBLE_GUILD", GetLocalInt(GetFirstPC(), "OS_NOBLE_GUILD"));

    // Kaidala seems to be under the impression the PC likes females and is female
    SetCampaignInt(sCampaign, "OS_NOBLE_GUILD", GetLocalInt(GetFirstPC(), "OS_NOBLE_GUILD"));

    // 10 = The PC knows about Becket's affair
    // 20 = The PC has told Ellysia about the affair and she believes
    // 30 = Ellysia does not believe you
    SetCampaignInt(sCampaign, "OS_BECKET_AFFAIR", GetLocalInt(GetFirstPC(), "OS_BECKET_AFFAIR"));

    // 10 = The nobles are voting for the pc
    SetCampaignInt(sCampaign, "OS_NOBLE_GUILD", GetLocalInt(GetFirstPC(), "OS_NOBLE_GUILD"));

    // 10 = Ellysia is sad
    // 20 = Ellysia is happy
    // 99 = Ellysia will not speak to you.
    SetCampaignInt(sCampaign, "OS_ELLYSIA_MOOD", GetLocalInt(GetFirstPC(), "OS_ELLYSIA_MOOD"));

    // Counts the number of votes Becket has.
    SetCampaignInt(sCampaign, "OS_BECKET_VOTES", GetLocalInt(GetModule(), "OS_BECKET_VOTES"));

    // 10 = The merchants are voting for the PC
    SetCampaignInt(sCampaign, "OS_THIEVES_GUILD", GetLocalInt(GetFirstPC(), "OS_THIEVES_GUILD"));

    // 10 = The foresters are voting for the PC
    SetCampaignInt(sCampaign, "OS_FOREST_GUILD", GetLocalInt(GetFirstPC(), "OS_FOREST_GUILD"));

    // 10 = The PC has agreed to make Becket the Banner
    // 20 = The PC has made Becket the Banner
    // 99 = The PC has failed to make becket the Banner
    SetCampaignInt(sCampaign, "OS_BECKET_BANNER", GetLocalInt(GetModule(), "OS_BECKET_BANNER"));

    // 10 = The PC has been told about the Dwarf job
    // 20 = The PC has chosen the Dwarf job
    // 30 = The PC has completed the Dwarf job
    // 40 = The PC has been rewarded for the Dwarf job
    SetCampaignInt(sCampaign, "OS_THEGORD_DWARF", GetLocalInt(GetModule(), "OS_THEGORD_DWARF"));

    // 10 = The PC has been told about the cow job
    // 20 = The PC has chosen the cow job
    // 30 = The PC has completed the cow job
    // 35 = The PC has completed the cow job, but the cows are dead
    // 40 = The PC has been rewarded for the cow job
    SetCampaignInt(sCampaign, "OS_THEGORD_COWS", GetLocalInt(GetModule(), "OS_THEGORD_COWS"));

    // 10 = The PC has been told about the archeologist job
    // 20 = The PC has chosen the archeologist job
    // 30 = The PC has completed the archeologist job
    // 35 = The Archaeologist is dead
    // 40 = The PC has been rewarded for the archeologist job
    SetCampaignInt(sCampaign, "OS_THEGORD_ARCH", GetLocalInt(GetModule(), "OS_THEGORD_ARCH"));

    // Counts the number of votes the PC has
    SetCampaignInt(sCampaign, "OS_PC_VOTES", GetLocalInt(GetFirstPC(), "OS_PC_VOTES"));

    // 10 = The PC has the Trades vote
    SetCampaignInt(sCampaign, "OS_TRADES_GUILD", GetLocalInt(GetFirstPC(), "OS_TRADES_GUILD"));

    // 99 = You've irked Enivid
    SetCampaignInt(sCampaign, "OS_ENIVID_ANGRY", GetLocalInt(GetModule(), "OS_ENIVID_ANGRY"));

    // Counts the number of votes Enivid has
    SetCampaignInt(sCampaign, "OS_ENIVID_VOTES", GetLocalInt(GetModule(), "OS_ENIVID_VOTES"));

    // 10 = The Banner is the PC
    // 15 = The PC has rejected the Banner position
    // 20 = Enivid is Banner
    // 30 = Jaboli is Banner
    // 40 = Calibast is the Banner
    // 50 = Trip is the Banner
    // 60 = Alias
    // 70 = Yenna
    // 80 = Feran
    // 90 = Becket
    SetCampaignInt(sCampaign, "OS_BANNER", GetLocalInt(GetFirstPC(), "OS_BANNER"));

    // 10 = Calibast
    // 20 = Enivid
    // 30 = Feran
    SetCampaignInt(sCampaign, "OS_HAND", GetLocalInt(GetFirstPC(), "OS_HAND"));

    // 10 = Feran is dead
    SetCampaignInt(sCampaign, "OS_FERAN_DEAD", GetLocalInt(GetFirstPC(), "OS_FERAN_DEAD"));

    // 10 = Kaidala has given the seed to the PC
    // 20 = The PC has planted the seed
    // 30 = The seed has grown to a shrub
    // 40 = Kaidala is about to have her nightmare
    // 50 = Kaidala has her nightmare
    // 60 = Kaidala is fighting the nightmare
    // 70 = The nightmare is dead
    // 80 = The nightmare is dead and Kaidala has initiated
    SetCampaignInt(sCampaign, "OS_KAI_PLANT", GetLocalInt(GetFirstPC(), "OS_KAI_PLANT"));

    // 10=The PC has started the romance plot
    // 99=The PC has ended the romance plot
    SetCampaignInt(sCampaign, "OS_KAI_ROMANCE", GetLocalInt(GetFirstPC(), "OS_KAI_ROMANCE"));

    // 5 = Calibast has made a tentative start to the romance plot
    // 10 = The PC has started the romance plot
    // 20 = Calibast's drinking curbed
    // 30 = Calibast's womanizing curbed
    // 40 = Calibast pacifies the pc's need for attention
    // 75 = The PC and Calibast live happily ever after
    // 80 = Calibast cannot continue with Romance
    // 90 = The PC has refused Calibast's ring
    // 99 = The PC has ended the romance plot
    SetCampaignInt(sCampaign, "OS_CAL_ROMANCE", GetLocalInt(GetFirstPC(), "OS_CAL_ROMANCE"));

    // 50 = Jaboli is neutral
    SetCampaignInt(sCampaign, "OS_JAB_LIKE", GetLocalInt(GetFirstPC(), "OS_JAB_LIKE"));

    // 10 = Jaboli betrays the PC
    // 99 = Jaboli has conquered the urge to betray
    SetCampaignInt(sCampaign, "OS_JABOLI_BETRAY", GetLocalInt(GetFirstPC(), "OS_JABOLI_BETRAY"));

    // 10 = Jaboli hates the PC
    SetCampaignInt(sCampaign, "OS_JAB_HATE", GetLocalInt(GetFirstPC(), "OS_JAB_HATE"));

    // 10 = Feran has quit
    SetCampaignInt(sCampaign, "OS_FERAN_GONE", GetLocalInt(GetFirstPC(), "OS_FERAN_GONE"));

    // 1 = the PC lied to the candelabra
    // 2 = The PC admitted ownership
    SetCampaignInt(sCampaign, "q2_pcliedtobutler", GetLocalInt(GetFirstPC(), "q2_pcliedtobutler"));


}
