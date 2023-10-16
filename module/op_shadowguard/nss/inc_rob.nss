//Rob Bartel's Include File for Shadowguard 1
//
//  (Handle a few special functions required for cleaining up the module.)



//Save the Shadowguard 1 variables out to the database for oPC
void Rob_SaveDatabase(object oPC);

//Display the Credits sequence
void Rob_DisplayCredits();

//Define the Credits for the Shadowguard 1 module
void Rob_DefineCredits();

//Rotate the camera endlessly for the closing cutscene.
void Rob_CameraSpin();

//Return the journal state
//   oPC = the player whose journal is being referenced.
//   sTag = the tag of the Journal Quest
int Rob_GetJournalState(object oPC, string sTag);

//Handle the creature spawning for the "Chronicles of Abaran" cutscene
//  iChapter = the chapter to be viewed.
void SpawnChronicles(int iChapter);

//Destroy all NPCs in the given area. PCs and Associates are not affected.
//  oArea = the area to be cleared of NPCs.
void DestroyAllNPCsInArea(object oArea = OBJECT_SELF);

//Spawn in the Spirit of Malgor. Handled as a separate function so it can be
//delayed.
void Rob_CreateMalgor(object oPC);


//----------END DECLARATIONS----------//

//Save the Shadowguard 1 variables out to the database
void Rob_SaveDatabase(object oPC)
{
    //Define the Campaign Name
    string sCamp = "Shadowguard";

    //Flag the player as having completed SG1
    SetCampaignInt(sCamp, "SG1_Completed", TRUE, oPC);

    //Journal states
    int iTarinPlot = Rob_GetJournalState(oPC, "JT_PREL_TARI");
    SetCampaignInt(sCamp, "SG1_TarinPlot", iTarinPlot, oPC);

    // What did the PC do with Ghan's Brooch?
    int iTarinBrooch = GetLocalInt(oPC, "JT_PREL_TARI_KEPTBROOCH");
    SetCampaignInt(sCamp, "SG1_TarinPlot_BroochKept", iTarinBrooch, oPC);
    iTarinBrooch = GetLocalInt(oPC, "JT_PREL_TARI_SOLDBROOCH");
    SetCampaignInt(sCamp, "SG1_TarinPlot_BroochSold", iTarinBrooch, oPC);
    iTarinBrooch = GetLocalInt(oPC, "JT_PREL_TARI_RETURNEDBROOCH");
    SetCampaignInt(sCamp, "SG1_TarinPlot_BroochReturned", iTarinBrooch, oPC);

    int iLyenPlot = Rob_GetJournalState(oPC, "JT_PREL_LYEN");
    SetCampaignInt(sCamp, "SG1_LyenPlot", iLyenPlot, oPC);
    int iMarkiusPlot = Rob_GetJournalState(oPC, "JT_PREL_MARKIUS");
    SetCampaignInt(sCamp, "SG1_MarkiusPlot", iMarkiusPlot, oPC);

    // kara plots part one and two
    int iKaraPlot = Rob_GetJournalState(oPC, "JT_PREL_KARA");
    SetCampaignInt(sCamp, "SG1_KaraPlot", iKaraPlot, oPC);
    int iKaraPlot2 = Rob_GetJournalState(oPC, "JT_PREL_KARA_2");
    SetCampaignInt(sCamp, "SG1_KaraPlot_2", iKaraPlot2, oPC);

    int iJanthosPlot = Rob_GetJournalState(oPC, "JT_JANTHOS");
    SetCampaignInt(sCamp, "SG1_JanthosPlot", iJanthosPlot, oPC);
    int iGradCeremony = Rob_GetJournalState(oPC, "JT_GRAD_CEREMONY");
    SetCampaignInt(sCamp, "SG1_GradCeremony", iGradCeremony, oPC);

    //Relationship with father

    // Check for the crests
    if (GetItemPossessedBy(oPC,"CrestoftheEnforcer") != OBJECT_INVALID)
        SetCampaignInt(sCamp, "SG1_CREST_ENFORCER", TRUE, oPC);
    if (GetItemPossessedBy(oPC,"CrestoftheGuardian") != OBJECT_INVALID)
        SetCampaignInt(sCamp, "SG1_CREST_GUARDIAN", TRUE, oPC);
    if (GetItemPossessedBy(oPC,"CrestoftheRedeemer") != OBJECT_INVALID)
        SetCampaignInt(sCamp, "SG1_CREST_REDEEMER", TRUE, oPC);

    // chech the count on love-neutral-hate nodes followed.
    int iFatherNeut = GetLocalInt(oPC, "SG1_NEUT_FATHER");
    SetCampaignInt(sCamp, "SG1_NEUT_FATHER", iFatherNeut, oPC);
    int iFatherLove = GetLocalInt(oPC, "SG1_LOVE_FATHER");
    SetCampaignInt(sCamp, "SG1_LOVE_FATHER", iFatherLove, oPC);
    int iFatherHate = GetLocalInt(oPC, "SG1_HATE_FATHER");
    SetCampaignInt(sCamp, "SG1_HATE_FATHER", iFatherHate, oPC);
}

//Display the Credits sequence
void Rob_DisplayCredits()
{
    object oCreditPC = GetFirstPC();
    int iN = 1;
    string sCredit = GetLocalString(GetModule(), "s"+IntToString(iN));
    while (sCredit != "//END//")
    {
        oCreditPC = GetFirstPC();

        while (oCreditPC != OBJECT_INVALID)
        {
            DelayCommand(IntToFloat(iN),
                FloatingTextStringOnCreature(sCredit, oCreditPC, FALSE));

            oCreditPC = GetNextPC();
        }
        iN++;
        sCredit = GetLocalString(GetModule(), "s"+IntToString(iN));
    }
}

//Define the Credits for the Shadowguard 1 module
void Rob_DefineCredits()
{
    int iN = 0;
    object oM = GetModule();
    SetLocalString(oM, "s"+IntToString(iN++), "Congratulations!");
    SetLocalString(oM, "s"+IntToString(iN++), "You have just completed");
    SetLocalString(oM, "s"+IntToString(iN++), "''Shadowguard I: Rites of Passage''");
    SetLocalString(oM, "s"+IntToString(iN++), "by Ben ''Altaris'' McJunkin and Rob Bartel.");
    SetLocalString(oM, "s"+IntToString(iN++), "Thank you for playing.");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< CREDITS >>");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< Designed by: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Ben ''Altaris'' McJunkin");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< Implemented by: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Ben ''Altaris'' McJunkin");
    SetLocalString(oM, "s"+IntToString(iN++), "Rob Bartel");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< Released by: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "The BioWare Community Live Team");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< BioWare Internal Quality Assurance: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Jonathan Epp");
    SetLocalString(oM, "s"+IntToString(iN++), "Bruce Venne");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< BioWare Community Live Team: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Diarmid Clarke - External Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Priddle - Marketing Director");
    SetLocalString(oM, "s"+IntToString(iN++), "Jay Watamaniak - Community Manager");
    SetLocalString(oM, "s"+IntToString(iN++), "Derek French - Associate Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Robin Mayne - Web Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Jeff Marvin - Web Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Johnn Four - Web Content Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Welburn - Game Programmer");
    SetLocalString(oM, "s"+IntToString(iN++), "Owen Borsdtadt - Tools Programmer");
    SetLocalString(oM, "s"+IntToString(iN++), "Colin Walmsley - Web Artist");
    SetLocalString(oM, "s"+IntToString(iN++), "Duleepa Wijayawardhana - Systems Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Miller - Systems Administrator");
    SetLocalString(oM, "s"+IntToString(iN++), "Dave McGruther - Systems Administrator");
    SetLocalString(oM, "s"+IntToString(iN++), "Tom Ohle - Public Relations");
    SetLocalString(oM, "s"+IntToString(iN++), "Jonathan Epp - Lead Quality Assurance");
    SetLocalString(oM, "s"+IntToString(iN++), "Bruce Venne - Quality Assurance");
    SetLocalString(oM, "s"+IntToString(iN++), "Keith Hayward - Technical Designer");
    SetLocalString(oM, "s"+IntToString(iN++), "Rob Bartel - Senior Designer");
    SetLocalString(oM, "s"+IntToString(iN++), "//END//");
}

//Rotate the camera endlessly for the closing cutscene.
void Rob_CameraSpin()
{
     object oPC = GetFirstPC();

     //Snap to the initial position.
     //AssignCommand(oPC, SetCameraFacing(90.0, 25.0, 80.0));

     //Execute a self-calling script to handle the rotations.
     DelayCommand(0.2f, ExecuteScript("sg1_cameraspin", oPC));
}

//Get the journal state
//  sTag = the tag of the Journal Quest
int Rob_GetJournalState(object oPC, string sTag)
{
    string sResRef = "NW_JOURNAL_ENTRY"+sTag;
    int iJournalState = GetLocalInt(oPC, sResRef);
    return iJournalState;
}

//Handle the creature spawning for the "Chronicles of Abaran" cutscene
//  iChapter = the chapter to be viewed.
void SpawnChronicles(int iChapter)
{
    //Define the base resrefs according to chapter.
    int iN = 0;
    object oM = GetModule();
    switch (iChapter)
    {
        //King Khagrim abuses the people
        case 1:
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so1");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so2");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so3");
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_dl_01");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_oldman1");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_oldwoman1");
            break;

        //Rakha heals the people
        case 2:
            SetLocalString(oM, "s"+IntToString(iN++), "nw_oldman2");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_oldwoman2");
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_rakh1");
            break;

        //Rakha destroys King Khagrim
        case 3:
            SetLocalString(oM, "s"+IntToString(iN++), "comm_pers_1a");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_pers_1b");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_pers_1c");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so4");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so5");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_evil_so6");
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_dl_02");
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_rakh2");
            break;

        //The people come to worship Rakha
        case 4:
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_rakh3");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_cit_1");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_cit_2");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_cit_3");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_cit_4");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_1");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_2");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_3");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_4");
            break;

        //The Crimson Prophet sparks resistance
        case 5:
            SetLocalString(oM, "s"+IntToString(iN++), "comm_cf_fol01");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_cf_fol02");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_cf_fol03");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_cf_fol04");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_cf_fol05");
            SetLocalString(oM, "s"+IntToString(iN++), "uniq_nt_crim1");
            break;

        //The Shadowguard kick some ass
        case 6:
            SetLocalString(oM, "s"+IntToString(iN++), "op_hench_bruk");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_stg01");
            SetLocalString(oM, "s"+IntToString(iN++), "comm_sh_stg02");
            SetLocalString(oM, "s"+IntToString(iN++), "op_hench_kara");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_noblfemale");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_noblmale");
            SetLocalString(oM, "s"+IntToString(iN++), "op_hench_lyen");
            SetLocalString(oM, "s"+IntToString(iN++), "op_hench_mark");
            SetLocalString(oM, "s"+IntToString(iN++), "dead_ox");
            SetLocalString(oM, "s"+IntToString(iN++), "op_hench_tari");
            SetLocalString(oM, "s"+IntToString(iN++), "nw_femalekid1");
            break;
    }

    //Cap the list with an //END// marker
    SetLocalString(oM, "s"+IntToString(iN++), "//END//");

    //Spawn in the creatures
    iN = 0;
    string sBase = GetLocalString(GetModule(), "s"+IntToString(iN));
    object oWP;
    location lWP;
    string sTemplate;
    while (sBase != "//END//")
    {
        //Create the creature at its corresponding waypoint
        oWP = GetObjectByTag("wp_"+sBase);
        lWP = GetLocation(oWP);
        sTemplate = "ct_"+sBase;
        object oCreature = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lWP);

        //Remove its walkmesh so it won't bump with future iterations.
        effect eGhost = EffectCutsceneGhost();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oCreature);

        //Update the loop variables
        iN++;
        sBase = GetLocalString(GetModule(), "s"+IntToString(iN));
    }
}


//Destroy all NPCs in the given area. PCs and Associates are not affected.
//  oArea = the area to be cleared of NPCs.
void DestroyAllNPCsInArea(object oArea = OBJECT_SELF)
{
    //Parse through all objects in the area
    object oObject = GetFirstObjectInArea(oArea);
    int iObjectType;
    object oMaster;
    while (oObject != OBJECT_INVALID)
    {
        //Destroy any creatures that aren't the PC and don't have a PC as their master
        iObjectType = GetObjectType(oObject);
        oMaster = GetMaster(oObject);
        if (iObjectType == OBJECT_TYPE_CREATURE &&
            GetIsPC(oObject) == FALSE &&
            GetIsPC(oMaster) == FALSE)
        {
            DestroyObject(oObject);
        }

        //Update the loop variable
        oObject = GetNextObjectInArea(oArea);
    }
}


//Spawn in the Spirit of Malgor. Handled as a separate function so it can be
//delayed.
void Rob_CreateMalgor(object oPC)
{
    object oWP = GetNearestObjectByTag("WP_CT_UNIQ_UN_MALG", oPC);
    CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_UN_MALG", GetLocation(oWP));
}

