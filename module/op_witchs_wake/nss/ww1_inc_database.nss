//::///////////////////////////////////////////////
//:: Witch Wake 1: Database Include
//:: WW1_Inc_Database.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Save all important variables into the
     Campaign Database.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 18, 2003
//////////////////////////////////////////////////

void WW1_SaveDatabase()
{
    object oPC = GetFirstPC();

    //Parse through all PCs.
    while (oPC != OBJECT_INVALID)
    {
        //Put the player in cutscene mode just to be safe.
        SetCutsceneMode(oPC, TRUE);

        //Identify all of the important variables and get their state for this
        //player.

            //PRINCE AHMED
                //Dying prince implies that the player was always there for him.
                int bPRINCE_Always = GetLocalInt(oPC, "CONV_AHMED_Always");
                //Player built cairn for prince.
                int bPRINCE_BuiltCairn = GetLocalInt(oPC, "CONV_AHMED_BuiltCairn");
                //Dying prince says "Do not hate me for what I have done."
                int bPRINCE_Hate = GetLocalInt(oPC, "CONV_AHMED_Hate");
                //Dying prince implies that we brought this destruction on ourselves.
                int bPRINCE_Ourselves = GetLocalInt(oPC, "CONV_AHMED_Ourselves");
                //Dying prince confides that "we have already won" the battle.
                int bPRINCE_Won = GetLocalInt(oPC, "CONV_AHMED_Won");

            //RAGPICKER / NIGHT HAG
                //The player's finger was severed by the Ragpicker.
                int bRAGP_Finger = GetLocalInt(oPC, "CONV_RAGPICKER_Fingerless");
                //The Tarot Card drawn for the player's Warlock Hand
                    //..."Anger", "Fear", "Passion", "Sorrow", "Virtue"...
                string sHAG_WarlockHand = GetLocalString(oPC, "CONV_NIGHTHAG_Warlock'sHand");
                //The Tarot Card drawn for the player's Witch's Hand
                    //..."Fool", "Leader", "Traitor"...
                string sHAG_WitchHand = GetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand");
                //Night Hag tells the player that there used to be a heaven.
                int bHAG_NoHeaven = GetLocalInt(oPC, "XP_KN_NoHeaven");
                //Player refused Night Hag's offer of assistance, thereby losing
                //access to the Plane of Sorrows.
                int bHAG_Refused = GetLocalInt(oPC, "CONV_NIGHT_HAG_Refused");

            //MORRIUS HELMSPLITTER
                //Morrius warned the player that the Night Hag's not to be trusted.
                //(if this is false, the player hasn't talked to him at all).
                int bMORRIUS_Trust = GetLocalInt(oPC, "CONV_MORRIUS_Trust");
                //Player has driven Morrius mad.
                int bMORRIUS_Mad = GetLocalInt(oPC, "CONV_MORRIUS_Mad");
                //Player learns that Witchbane has been drained of its former magic.
                int bMORRIUS_Witchbane = GetLocalInt(oPC, "XP_KN_WitchbaneDrained");
                //Morrius claims that the Prince can't be found among the dead.
                int bMORRIUS_Prince = GetLocalInt(oPC, "CONV_MORRIUS_Prince");

            //OLD MAN NIMMERMAER
                //Nimmermaer says Night Hag is of the fey, who cannot lie any more
                //than they can tell the truth.
                int bNIMM_HagFey = GetLocalInt(oPC, "XP_KN_NightHagIsFey");
                //Nimmermaer says Ethereal Leaks can only be seen by those who have
                //sacrificed everything for a cause.
                int bNIMM_Sacrifice = GetLocalInt(oPC, "XP_KN_LeakSacrifice");
                //Nimmermaer says that one of the Stygians escaped and remains
                //loose within the world.
                int bNIMM_Stygian = GetLocalInt(oPC, "XP_KN_StygiansAmongUs");

            //BROGAN'S ARM GUILD EXHIBITS
                //EXHIBIT 1: Origins of the Cairn Dwarves under the peaceful rule
                //of Brogan Nachtjager.
                int bEXHIBIT_1 = GetLocalInt(oPC, "XP_KN_Exhibit1");
                //EXHIBIT 2: Elderly Brogan tunnels into the Abyss.
                int bEXHIBIT_2 = GetLocalInt(oPC, "XP_KN_Exhibit2");
                //EXHIBIT 3: Brogan bests the Stygians but is betrayed. Stygians
                //invade Brogan's Deep. Dwarves collapse it and escape to the
                //surface.
                int bEXHIBIT_3 = GetLocalInt(oPC, "XP_KN_Exhibit3");
                //EXHIBIT 4: Barrow Dwarves eke out living on surface. Old Man
                //Cavanaugh finds remains of Brogan's arm. Village built around
                //resulting holy site.
                int bEXHIBIT_4 = GetLocalInt(oPC, "XP_KN_Exhibit4");
                //EXHIBIT 5a: Discussion of Brogan's Tears phenomena.
                int bEXHIBIT_5a = GetLocalInt(oPC, "XP_KN_Exhibit5a");
                //EXHIBIT 5b: Discussion of the Barrow Site.
                int bEXHIBIT_5b = GetLocalInt(oPC, "XP_KN_Exhibit5b");
                //EXHIBIT 6: Steinfaar Mine and the return of the Stygian Hordes.
                //All but top floor of mine collapsed.
                int bEXHIBIT_6 = GetLocalInt(oPC, "XP_KN_Exhibit6");
                //EXHIBIT 7: Steinfaar Mine is being returned to production.
                int bEXHIBIT_7 = GetLocalInt(oPC, "XP_KN_Exhibit7");

            //ITEM USE
                //Iron Ring (discussion with unknown loyalist)
                int bITEM_IronRing = GetLocalInt(oPC, "CONV_IRONRING_Talked");
                //Gravehelm (vision of dwarven battle against Stygian hordes).
                int bITEM_Gravehelm = GetLocalInt(oPC, "XP_ST_Gravehelm");

            //CALDRIAN'S CHALK SCRAWLS
                //Player told Caldrian the "Tell the King that she is dead" msg.
                int bCALDRIAN_SheMsg = GetLocalInt(oPC, "CONV_CALD_SheMessage");
                //I must write everything down before I forget it all.
                int bCHALK_Msg1 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_1");
                //"[Player] promised to look after the Prince."
                int bCHALK_Msg2 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_2");
                //"I stayed behind to steal the Cavanaugh Stone. The others have
                //gone north. Soon we will be able to make the journey home."
                int bCHALK_Msg3 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_3");
                //"I am loyal to Prince Ahmed. I don't know if anyone else is."
                int bCHALK_Msg4 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_4");
                //"We have followed our quarry for years, pursuing her ever
                //northward. We have her cornered now. She cannot escape."
                int bCHALK_Msg5 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_5");
                //"I've been captured by Barrow Dwarves and thrown into this
                //mine. Morrius called them an evil and backward clan but I
                //don't remember why."
                int bCHALK_Msg6 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_6");
                //"I seek vengeance on behalf of my lord, the King of Barak'Thule."
                int bCHALK_Msg7 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_7");
                //"The others will come for me. The Prince said he knew I would
                //be in danger and that he had a plan. He promised me that someone
                //would be sent."
                int bCHALK_Msg8 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_8");
                //The western route will get us home the quickest. The route we
                //came by took longer.
                int bCHALK_Msg9 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_9");
                //I don't remember what I was supposed to write.
                int bCHALK_Msg10 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_10");
                //"Long ride the Witch Hunters and longer be their journey home."
                int bCHALK_Msg11 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_11");
                //Have there always been so many rats?
                int bCHALK_Msg12 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_12");
                //How long have I been here? I don't remember writing all of
                //these messages.
                int bCHALK_Msg13 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_13");
                //"I am Caldrian Ayre, of the King's Court in Barak'Thule."
                int bCHALK_Msg14 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_14");
                //I wear a gold ring.
                int bCHALK_Msg15 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_15");
                //I've been de-leveled.
                int bCHALK_Msg16 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_16");
                //"Apologize to the Herdkeeper."
                int bCHALK_Msg17 = GetLocalInt(oPC, "MSG_MINE_SCRAWL_17");

            //MISCELLANEOUS
                //Player searched the Elkentree for Angmar's gold.
                int bANGMAR_Tree = GetLocalInt(oPC, "XP_CH_ElkentreeSearch");
                //Player learned that the Elkenbeast's corpse was getting warmer
                //instead of colder.
                int bELK_Carcass = GetLocalInt(oPC, "XP_KN_CarcassWarming");
                //Player learns that the Ratling was formerly known as Baron
                //Androleth.
                int bRATLING_Androleth = GetLocalInt(oPC, "XP_KN_RatlingIsBaron");

        //Save all of the above variables into the database.
        SetCampaignInt("Witch's Wake", "WW1_bPRINCE_Always", bPRINCE_Always, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bPRINCE_BuiltCairn", bPRINCE_BuiltCairn, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bPRINCE_Hate", bPRINCE_Hate, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bPRINCE_Ourselves", bPRINCE_Ourselves, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bPRINCE_Won", bPRINCE_Won, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bRAGP_Finger", bRAGP_Finger, oPC);
        SetCampaignString("Witch's Wake", "WW1_sHAG_WarlockHand", sHAG_WarlockHand, oPC);
        SetCampaignString("Witch's Wake", "WW1_sHAG_WitchHand", sHAG_WitchHand, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bHAG_NoHeaven", bHAG_NoHeaven, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bHAG_Refused", bHAG_Refused, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bMORRIUS_Trust", bMORRIUS_Trust, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bMORRIUS_Mad", bMORRIUS_Mad, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bMORRIUS_Witchbane", bMORRIUS_Witchbane, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bMORRIUS_Prince", bMORRIUS_Prince, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bNIMM_HagFey", bNIMM_HagFey, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bNIMM_Sacrifice", bNIMM_Sacrifice, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bNIMM_Stygian", bNIMM_Stygian, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_1", bEXHIBIT_1, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_2", bEXHIBIT_2, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_3", bEXHIBIT_3, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_4", bEXHIBIT_4, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_5a", bEXHIBIT_5a, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_5b", bEXHIBIT_5b, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_6", bEXHIBIT_6, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bEXHIBIT_7", bEXHIBIT_7, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bITEM_IronRing", bITEM_IronRing, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bITEM_Gravehelm", bITEM_Gravehelm, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCALDRIAN_SheMsg", bCALDRIAN_SheMsg, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg1", bCHALK_Msg1, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg2", bCHALK_Msg2, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg3", bCHALK_Msg3, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg4", bCHALK_Msg4, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg5", bCHALK_Msg5, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg6", bCHALK_Msg6, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg7", bCHALK_Msg7, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg8", bCHALK_Msg8, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg9", bCHALK_Msg9, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg10", bCHALK_Msg10, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg11", bCHALK_Msg11, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg12", bCHALK_Msg12, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg13", bCHALK_Msg13, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg14", bCHALK_Msg14, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg15", bCHALK_Msg15, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg16", bCHALK_Msg16, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bCHALK_Msg17", bCHALK_Msg17, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bANGMAR_Tree", bANGMAR_Tree, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bELK_Carcass", bELK_Carcass, oPC);
        SetCampaignInt("Witch's Wake", "WW1_bRATLING_Androleth", bRATLING_Androleth, oPC);

        //Flag this database as now existing.
        SetCampaignInt("Witch'sWake", "WW1_DatabaseExists", TRUE, oPC);

        //Take the player out of cutscene mode.
        SetCutsceneMode(oPC, FALSE);

        //Get the next PC and parse through them all again.
        oPC = GetNextPC();
    }
}
