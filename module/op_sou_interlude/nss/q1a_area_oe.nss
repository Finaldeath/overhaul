// Client enter FIRST area: need to find the right starting location.
// The var "X1_CURRENT_START" holds the current start location.
// A new player will be jumped to that location. An old player will be flagged as soon as
// he enters the oasis by the var "X1_ENTRED_OASIS"

// When module starts: get the updated henchmen objects, and level them up to level 6 if below that.
// If there are no henchmen objects: level them all to level 6 based on the original henchman.

#include "x0_i0_henchman"
#include "x1_inc_plot"

int MIN_LEVEL = 6;
string XANOS_TAG = "x0_hen_xan";
string DEEKIN_TAG = "x0_hen_dee";
string DORNA_TAG = "x0_hen_dor";

object GetJournalPC();
void UpdateJournal(object oPC);

void CreateIdentifiedItem(string sItem, object oTarget, int nStackSize = 1)
{
    object oItem = CreateItemOnObject(sItem, oTarget, nStackSize);
    SetIdentified(oItem, TRUE);
}

int IsInvalidItem(object oItem)
{
    string sTag = GetTag(oItem);
    return (sTag == "x1_ice_phylac" ||
           sTag == "xp1_mystrashand" ||
           sTag == "q3_bearhorn" ||
           sTag == "Q3_ANCIENT_BOOK" ||
           sTag == "Q3A_KEY_JAIL" ||
           sTag == "Q3_CAGE_KEY" ||
           sTag == "focuscrystal" ||
           sTag == "mummifiedhand" ||
           sTag == "q5_Tymo_Amulet" ||
           sTag == "q7_banditbook" ||
           sTag == "q5_Deekin_Shoe" ||
           sTag == "Q5A_KEY_KOBOLD_PRISON" ||
           sTag == "q5_Tymo_Head"
           );
}

void DestroyPlotItems(object oObject)
{
    object oItem = GetFirstItemInInventory(oObject);
    string sTag;
    while(oItem != OBJECT_INVALID)
    {
        sTag = GetTag(oItem);
        if(sTag == "x1towercrystal")
           SetLocalInt(GetModule(), "X1_ONE_PLAYER_GOT_CRYSTAL", 1);
        if(IsInvalidItem(oItem))
                DestroyObject(oItem);

        oItem = GetNextItemInInventory(oObject);
    }
    oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oObject);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);

}

void DoSaveGame()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE", 1);
    DoSinglePlayerAutoSave();

}

void HandleZidanEnter(object oEnter)
{
    if(GetTag(oEnter) == "Q1_ZIDAN" && GetPlot("Q1_JOURNAL_MISSING_GUIDE") > 1)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ZIDNA_RUN_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ZIDNA_RUN_ONCE", 1);

        object oKatriana = GetObjectByTag("Q1_KATRIANA");
        SetLocalObject(oEnter, "Q1_FOLLOW", OBJECT_INVALID);
        AssignCommand(oEnter, ClearAllActions());
        DelayCommand(2.0, AssignCommand(oEnter, SpeakStringByStrRef(75931)));
        DelayCommand(2.0, AssignCommand(oEnter, ActionForceMoveToObject(oKatriana, TRUE, 3.0, 8.0)));
    }
}

void main()
{
    object oPC = GetEnteringObject();
    // Removed the next line so Zidan would follow the player until he reaches Katriana
    //HandleZidanEnter(oPC);
    if(!GetIsPC(oPC)) // should be also for DMs
        return;

    DoSaveGame();
    UpdateJournal(oPC);

    object oXanos = GetObjectByTag(XANOS_TAG);
    object oDeekin = GetObjectByTag(DEEKIN_TAG);
    object oDorna = GetObjectByTag(DORNA_TAG);
    object oHenchman;
    // associate a henchman for each pc, if that was the status at the end of chapter 1
    if(GetLocalInt(oPC, "XP1_CHECKED_FOR_HENCHMAN") == 0)
    {
        SetLocalInt(oPC, "XP1_CHECKED_FOR_HENCHMAN", 1);
        oHenchman = RetrieveCampaignObject("dbPlayers", "Henchman", GetLocation(oPC), OBJECT_INVALID, oPC);
        if(oHenchman != OBJECT_INVALID)
        {
            //StoreCampaignObject("dbPlayers", "Henchman", OBJECT_INVALID, oPC); // init the var
            DeleteCampaignVariable("dbPlayers", "Henchman", oPC);
            // destroy henchman if already exists
            if(GetTag(oHenchman) == XANOS_TAG)
            {
                if(oXanos != OBJECT_INVALID)
                    DestroyObject(oXanos);
                oXanos = oHenchman;
            }
            else if(GetTag(oHenchman) == DEEKIN_TAG)
            {
                if(oDeekin != OBJECT_INVALID)
                    DestroyObject(oDeekin);
                oDeekin = oHenchman;
            }
            else if(GetTag(oHenchman) == DORNA_TAG)
            {
                if(oDorna != OBJECT_INVALID)
                    DestroyObject(oDorna);
                oDorna = oHenchman;
            }
            HireHenchman(oPC, oHenchman);
        }
        oPC = GetNextPC();
    }

    // Do the global henchman check only once for the module
    int nDoOnce = GetLocalInt(GetModule(), "DO_HENCHMAN_CHECK_ONCE");
    if(nDoOnce == 0)
    {
        SetLocalInt(GetModule(), "DO_HENCHMAN_CHECK_ONCE", 1);
        object oXanosWP = GetWaypointByTag("Q1_WP_XANOS");
        object oDeekinWP = GetWaypointByTag("Q1_WP_DEEKIN");
        object oDornaWP = GetWaypointByTag("Q1_WP_DORNA");
        oPC = GetEnteringObject();
        if(oXanos == OBJECT_INVALID)
        {
            oXanos = RetrieveCampaignObject("dbHenchmen", "xp0_hen_xan", GetLocation(oXanosWP));
            DeleteCampaignVariable("dbHenchmen", "xp0_hen_xan");
        }
        if(oDeekin == OBJECT_INVALID)
        {
            oDeekin = RetrieveCampaignObject("dbHenchmen", "xp0_hen_dee", GetLocation(oDeekinWP));
            DeleteCampaignVariable("dbHenchmen", "xp0_hen_dee");
        }
        if(oDorna == OBJECT_INVALID)
        {
            oDorna = RetrieveCampaignObject("dbHenchmen", "xp0_hen_dor", GetLocation(oDornaWP));
            DeleteCampaignVariable("dbHenchmen", "xp0_hen_dor");
        }


        if(oXanos == OBJECT_INVALID)
            oXanos = CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_xan", GetLocation(oXanosWP));
        if(oDeekin == OBJECT_INVALID)
            oDeekin = CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_dee", GetLocation(oDeekinWP));
        if(oDorna == OBJECT_INVALID)
            oDorna = CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_dor", GetLocation(oDornaWP));
        LevelHenchmanUpTo(oXanos, MIN_LEVEL, CLASS_TYPE_BARBARIAN, 2);
        LevelHenchmanUpTo(oDorna, MIN_LEVEL, CLASS_TYPE_CLERIC, 10);
        LevelHenchmanUpTo(oDeekin, MIN_LEVEL + 1);

        //CreateIdentifiedItem("nw_it_mbracer002", oXanos);
        CreateIdentifiedItem("nw_wswmls002", oXanos);
        CreateIdentifiedItem("nw_wbwmxh002", oXanos);
        CreateIdentifiedItem("nw_wammbo008", oXanos, 99);
        CreateIdentifiedItem("nw_it_mpotion020", oXanos, 3);
        CreateIdentifiedItem("nw_maarcl088", oDeekin);
        CreateIdentifiedItem("nw_wammbo008", oDeekin, 99);
        //CreateIdentifiedItem("nw_wbwmxl002", oDeekin);
        //CreateIdentifiedItem("nw_wswmdg006", oDeekin);
        CreateIdentifiedItem("nw_it_mpotion020", oDeekin, 3);
        CreateIdentifiedItem("nw_maarcl045", oDorna);
        CreateIdentifiedItem("nw_ashlw001", oDorna);
        CreateIdentifiedItem("nw_wammar009", oDorna, 99);
        CreateIdentifiedItem("nw_waxmhn002", oDorna);
        CreateIdentifiedItem("nw_it_mpotion020", oDorna, 3);
        CreateIdentifiedItem("nw_wbwmsh002", oDorna);

        DestroyPlotItems(oDorna);
        DestroyPlotItems(oDeekin);
        DestroyPlotItems(oXanos);

        // Restore level-up status for Xanos and Dorna
        SetLocalInt(oXanos, "X0_L_LEVELRULES", GetCampaignInt("dbHenchmen", "XanosLevelStatus", oPC));
        SetLocalInt(oDorna, "X0_L_LEVELRULES", GetCampaignInt("dbHenchmen", "DornaLevelStatus", oPC));

    }

    // The following code has moved to a trigger around the starting point

    /*
    int bBeenInOasis = GetLocalInt(oPC, "X1_ENTRED_OASIS");
    int bBeenIsRestoredOasis = GetLocalInt(oPC, "X1_ENTRED_OASIS2");
    int bBeenInArchCamp = GetLocalInt(oPC, "X1_ENTRED_AO_CAMP");
    if(bBeenInOasis == 1 || bBeenInArchCamp == 1 || bBeenIsRestoredOasis == 1) // not a new player - need to do nothing with this one
        return;
    object oWP = GetLocalObject(GetModule(), "X1_CURRENT_START");
    if(oWP == OBJECT_INVALID)
        return;
    AssignCommand(oPC, JumpToObject(oWP));*/

}


void UpdateJournal(object oPC)
{
    int nDoOnce = GetLocalInt(oPC, "DO_JOURNAL_UPDATE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(oPC, "DO_JOURNAL_UPDATE_ONCE", 1);

    //The first time a PC enters the area (on start of the game)
    if (GetLocalInt(oPC, "nPCNumber") == 0)
    {
        //Set the entering object's PC number
        SetLocalInt(oPC, "nPCNumber", GetLocalInt(GetModule(), "nPCNumber"));
        //Increment the module's PC count
        SetLocalInt(GetModule(), "nPCNumber", GetLocalInt(GetModule(), "nPCNumber") + 1);

        if (GetLocalInt(oPC, "nPCNumber") >= 1)
        {
            //update journal entries - if needed.
            //find the lowest 'numbered' pc
            object oJournalPC = GetJournalPC();

            if (oJournalPC != OBJECT_INVALID)
            {
                //Add the journal entries from the lowest 'numbered' pc to the new pc
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYidcrystal") > 0)
                    AddJournalQuestEntry("idcrystal", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYidcrystal"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ1_JOURNAL_MISSING_GUIDE") > 0)
                    AddJournalQuestEntry("Q1_JOURNAL_MISSING_GUIDE", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ1_JOURNAL_MISSING_GUIDE"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_WATER") > 0)
                    AddJournalQuestEntry("Q2_JOURNAL_WATER", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_WATER"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_ROD") > 0)
                    AddJournalQuestEntry("Q2_JOURNAL_ROD", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_ROD"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ5_JOURNAL_WAY") > 0)
                    AddJournalQuestEntry("Q5_JOURNAL_WAY", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ5_JOURNAL_WAY"), oPC, FALSE);
            }
        }
    }
}

object GetJournalPC()
{
    int nFound = FALSE;
    int nPCNumber = 0;
    object oPC;
    object oJournalPC;
    while (nFound == FALSE && nPCNumber <= 64)
    {
        oPC = GetFirstPC();
        while (oPC != OBJECT_INVALID && nFound == FALSE)
        {
            if (GetLocalInt(oPC, "nPCNumber") == nPCNumber)
            {
                oJournalPC = oPC;
                nFound = TRUE;

            }
            oPC = GetNextPC();
        }
        nPCNumber = nPCNumber + 1;
    }
    return oJournalPC;
}
