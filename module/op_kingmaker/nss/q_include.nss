//::///////////////////////////////////////////////
//:: Kingmaker Include file
//:: q_include
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kingmaker Include File
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

const int OS_MW_GREATAXE = 1;
const int OS_MW_ONEAXE = 2;
const int OS_MW_BATTLEAXE = 3;
const int OS_MW_BASTARDSWORD = 4;
const int OS_MW_DAGGER = 5;
const int OS_MW_GREATSWORD = 6;
const int OS_MW_LONGSWORD = 7;
const int OS_MW_SHORTSWORD = 8;
const int OS_MW_SCIMITAR = 9;
const int OS_MW_KATANA = 10;
const int OS_MW_RAPIER = 11;
const int OS_MW_CLUB = 12;
const int OS_MW_HEAVYFLAIL = 13;
const int OS_MW_LIGHTFLAIL = 14;
const int OS_MW_LIGHTHAMMER = 15;
const int OS_MW_WARHAMMER = 16;
const int OS_MW_MACE = 17;
const int OS_MW_MORNINGSTAR = 18;
const int OS_MW_QUARTERSTAFF = 19;
const int OS_MW_DIREMACE = 20;
const int OS_MW_DOUBLEAXE = 21;
const int OS_MW_TWOBLADEDSWORD = 22;
const int OS_MW_KAMA = 23;
const int OS_MW_KUKRI = 24;
const int OS_MW_SICKLE = 25;
const int OS_MW_HALBERD = 26;
const int OS_MW_SCYTHE = 27;
const int OS_MW_SPEAR = 28;
const int OS_MW_HEAVYXBOW = 29;
const int OS_MW_LIGHTXBOW = 30;
const int OS_MW_LONGBOW = 31;
const int OS_MW_SHORTBOW = 32;
const int OS_MW_SLING = 33;

const int OS_MOMMAJI = 34;
const int OS_KAIDALA = 35;
const int OS_ENIVID = 36;
const int OS_SUCCUBUS = 37;
const int OS_ALIAS = 38;
const int OS_CALIBAST = 39;
const int OS_BECKET = 40;

//checks the urns to see if the gem puzzle is complete
void CheckGemPuzzle();

//checks to see which henchmen have been chosen and destroy the remaining ones
void q3_CheckChosen();

//checks to see if the player can use the magic weapon type
int os_CheckMW(int nWeapon);

//checks to see if the player has any lockpicks
int os_CheckLockPicks();

//deploys all troops into the caves
void os_DeployAll();

//deploys a few troops into the caves
void os_DeploySome();

//sets the kobolds hostile
void q3_KoboldHostile();

//changes MommaJi's shape
void q3_ChangeForm(int nShape);

//creates grandfather according to racial type of PC
void q3_CreateGrandpa(int nRace);

//all surrendering henchmen do so
void q3_HenchmenSurrender();

//checks to see what weapon the PC can use
void q3_GiveWeapon();

//locks the quester caves after the election is over
void q2_LockCaves();


//::///////////////////////////////////////////////
//:: CheckGemPuzzle()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks the urns to see if the gem puzzle is complete
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void CheckGemPuzzle()
{
    object oNorth = GetObjectByTag("q3af_urn_north");
    object oNEast = GetObjectByTag("q3af_urn_neast");
    object oNWest = GetObjectByTag("q3af_urn_nwest");
    object oSouth = GetObjectByTag("q3af_urn_south");
    object oSEast = GetObjectByTag("q3af_urn_seast");
    object oSWest = GetObjectByTag("q3af_urn_swest");
/*    object oPurple = GetObjectByTag("q3af_gem_purple");
    object oBlue = GetObjectByTag("q3af_gem_blue");
    object oGreen = GetObjectByTag("q3af_gem_green");
    object oOrange = GetObjectByTag("q3af_gem_orange");
    object oRed = GetObjectByTag("q3af_gem_red");
    if(oPurple==oSouth
        && oBlue==oSEast
        && oGreen==oSWest
        && oYellow==oNorth
        && oOrange==oNEast
        && oRed==oNWest)*/
    int nYellow = GetLocalInt(oNorth,"Q3AF_GEM");
    int nOrange = GetLocalInt(oNEast,"Q3AF_GEM");
    int nRed = GetLocalInt(oNWest,"Q3AF_GEM");
    int nPurple = GetLocalInt(oSouth,"Q3AF_GEM");
    int nBlue = GetLocalInt(oSEast,"Q3AF_GEM");
    int nGreen = GetLocalInt(oSWest,"Q3AF_GEM");
    if(nYellow == 1
        && nOrange == 1
        && nRed == 1
        && nPurple == 1
        && nBlue == 1
        && nGreen == 1)
    {
        object oDoor = GetObjectByTag("q3af_door_gem");
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
}

//::///////////////////////////////////////////////
//:: void q3_CheckChosen()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks to see which henchmen have been chosen and destroy the remaining ones
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void q3_CheckChosen()
{
    object oPC = GetFirstPC();
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN");
    if(nChosen >=2)
    {
        if(GetLocalInt(oPC,"Q3AI_CAL_CHOSEN")==0)
        {
            SetLocalInt(oPC,"Q3AI_CAL_CHOSEN",99);
        }
        if(GetLocalInt(oPC,"Q3AI_JAB_CHOSEN")==0)
        {
            SetLocalInt(oPC,"Q3AI_JAB_CHOSEN",99);
        }
        if(GetLocalInt(oPC,"Q3AI_KAI_CHOSEN")==0)
        {
            SetLocalInt(oPC,"Q3AI_KAI_CHOSEN",99);
        }
        if(GetLocalInt(oPC,"Q3AI_TRP_CHOSEN")==0)
        {
            SetLocalInt(oPC,"Q3AI_TRP_CHOSEN",99);
        }
        AddJournalQuestEntry("q1_magicweapon",20,oPC);
    }
}
//::///////////////////////////////////////////////
//:: os_CheckMW
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks to see if the player can use the magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
int os_CheckMW(int nWeapon)
{
    object oPC = GetFirstPC();
    switch(nWeapon)
    {
//    Axes
//    Greataxe: Martial (large)
        case OS_MW_GREATAXE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL, oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Handaxe: Martial monk
        case OS_MW_ONEAXE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Battleaxe: martial
        case OS_MW_BATTLEAXE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Bladed:
//    Bastard sword: exotic
        case OS_MW_BASTARDSWORD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Dagger: simple druid monk rogue wizard
        case OS_MW_DAGGER:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Greatsword: martial (large)
        case OS_MW_GREATSWORD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Longsword: martial elf
        case OS_MW_LONGSWORD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Shortsword: martial rogue
        case OS_MW_SHORTSWORD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Scimitar: Martial druid
        case OS_MW_SCIMITAR:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Katana: exotic
        case OS_MW_KATANA:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Rapier: Martial rogue elf
        case OS_MW_RAPIER:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Blunt:
//    Club: simple druid monk wizard
        case OS_MW_CLUB:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Heavy Flail: martial (large)
        case OS_MW_HEAVYFLAIL:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Light Flail: martial
        case OS_MW_LIGHTFLAIL:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Light Hammer: martial
        case OS_MW_LIGHTHAMMER:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Warhammer: martial
        case OS_MW_WARHAMMER:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Mace: simple rogue
        case OS_MW_MACE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Morningstar: simple rogue
        case OS_MW_MORNINGSTAR:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    quarter staff=simple druid monk rogue wizard (large)
        case OS_MW_QUARTERSTAFF:
        {
            if((GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))

            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Double (all large):
//    dire mace=exotic
        case OS_MW_DIREMACE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    double axe=exotic
        case OS_MW_DOUBLEAXE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    two bladed sword=exotic
        case OS_MW_TWOBLADEDSWORD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Exotics:
//    kama=exotic or monk
        case OS_MW_KAMA:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    kukri=exotic
        case OS_MW_KUKRI:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    sickle=simple or druid
        case OS_MW_SICKLE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Polearm: (all large)
//    Halberd: martial
        case OS_MW_HALBERD:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Scythe: exotic
        case OS_MW_SCYTHE:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC)
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Spear: simple druid
        case OS_MW_SPEAR:
        {
            if((GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC))
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Ranged:
//    Heavy Crossbow: simple monk rogue wizard
        case OS_MW_HEAVYXBOW:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Light crossbow: simple monk rogue wizard
        case OS_MW_LIGHTXBOW:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    longbow: martial elf (large)
        case OS_MW_LONGBOW:
        {
            if((GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF,oPC))
                && (GetRacialType(oPC)!=RACIAL_TYPE_GNOME
                && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING))

            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Shortbow: martial rogue elf
        case OS_MW_SHORTBOW:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
//    Sling: simple druid monk
        case OS_MW_SLING:
        {
            if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC)
                || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC))
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        break;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: os_CheckLockPicks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has any lockpicks
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int os_CheckLockPicks()
{
    object oPC = GetFirstPC();
    object oPicks1 = GetItemPossessedBy(oPC,"NW_IT_PICKS001");
    object oPicks3 = GetItemPossessedBy(oPC,"NW_IT_PICKS002");
    object oPicks6 = GetItemPossessedBy(oPC,"NW_IT_PICKS003");
    object oPicks8 = GetItemPossessedBy(oPC,"X2_IT_PICKS001");
    object oPicks10 = GetItemPossessedBy(oPC,"NW_IT_PICKS004");
    object oPicks12 = GetItemPossessedBy(oPC,"X2_IT_PICKS002");
    if(GetIsObjectValid(oPicks1)
        || GetIsObjectValid(oPicks3)
        || GetIsObjectValid(oPicks10)
        || GetIsObjectValid(oPicks12)
        || GetIsObjectValid(oPicks8)
        || GetIsObjectValid(oPicks6))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_DeployAll
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    clear three caves, with lots of men dead through all three and into fourth
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void os_DeployAll()
{
    object oWay = GetObjectByTag("q1_map_illithid");
    location lWay = GetLocation(oWay);
    object oWay2 = GetObjectByTag("q3_way_captain");
    location lWay2 = GetLocation(oWay2);
    CreateObject(OBJECT_TYPE_CREATURE,"q3_iminers",lWay);
    CreateObject(OBJECT_TYPE_CREATURE,"q3_icaptain",lWay2);
}

//::///////////////////////////////////////////////
//:: os_DeploySome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    have 2 caves clear of encounters, with men and monsters dead in third
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void os_DeploySome()
{
    object oWay = GetObjectByTag("q1_map_illithid");
    location lWay = GetLocation(oWay);
    object oWay2 = GetObjectByTag("q3_way_captain");
    location lWay2 = GetLocation(oWay2);
    CreateObject(OBJECT_TYPE_CREATURE,"q3_iminers",lWay);
    CreateObject(OBJECT_TYPE_CREATURE,"q3_icaptain",lWay2);
}

//::///////////////////////////////////////////////
//:: q3_KoboldHostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the kobolds hostile
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void q3_KoboldHostile()
{
    object oSnivel = GetObjectByTag("q3_kob_honey");
    object oChief = GetObjectByTag("q3_kchief");
    object oKobold;
    int nCount;
    object oEnc;
    ChangeToStandardFaction(oSnivel,STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oChief,STANDARD_FACTION_HOSTILE);
    for(nCount = 0; nCount < 4; nCount++)
    {
        oKobold = GetObjectByTag("q3_kdrugged", nCount);
        ChangeToStandardFaction(oKobold,STANDARD_FACTION_HOSTILE);
    }
    for(nCount = 0; nCount < 5; nCount++)
    {
        oEnc = GetObjectByTag("q3_enc_kobold",nCount);
        SetEncounterActive(TRUE, oEnc);
    }
}

//::///////////////////////////////////////////////
//:: q3_ChangeForm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    changes MommaJi's shape
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void q3_ChangeForm(int nShape)
{
    ActionPauseConversation();
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,OBJECT_SELF,0.5);
//    effect ePoly;
    int nType;
    switch(nShape)
    {
        case OS_MOMMAJI:
        {
            nType = 240;
        }
        break;
        case OS_KAIDALA:
        {
            nType = 290;
        }
        break;
        case OS_ENIVID:
        {
            nType = 262;
        }
        break;
        case OS_SUCCUBUS:
        {
            nType = 163;
        }
        break;
        case OS_ALIAS:
        {
            nType = 257;
        }
        break;
        case OS_CALIBAST:
        {
            nType = 428;
        }
        break;
        case OS_BECKET:
        {
            nType = 276;
        }
        break;
    }
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePoly,OBJECT_SELF);
    SetCreatureAppearanceType(OBJECT_SELF,nType);
    ActionResumeConversation();
}

//::///////////////////////////////////////////////
//:: q3_CreateGrandpa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    creates grandfather according to racial type of PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void q3_CreateGrandpa(int nRace)
{
    string sGrandpa;
    switch(nRace)
    {
        case 1:
        {
            sGrandpa = "q3_grandhuman";
        }
        break;
        case 2:
        {
            sGrandpa = "q3_grandelf";
        }
        break;
        case 3:
        {
            sGrandpa = "q3_granddwarf";
        }
        break;
        case 4:
        {
            sGrandpa = "q3_grandgnome";
        }
        break;
        case 5:
        {
            sGrandpa = "q3_grandhalf";
        }
        break;
    }
    object oWay = GetObjectByTag("q3_way_grandpa");
    location lWay = GetLocation(oWay);
    CreateObject(OBJECT_TYPE_CREATURE,sGrandpa,lWay);
}

//::///////////////////////////////////////////////
//:: q3_HenchmenSurrender
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    all surrendering henchmen do so
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void q3_HenchmenSurrender()
{
    object oCal = GetObjectByTag("q3_sur_cal");
    object oKai = GetObjectByTag("q3_sur_kai");
    object oJab = GetObjectByTag("q3_sur_jab");
    object oTrip = GetObjectByTag("q3_sur_trp");
    object oHenCal = GetNearestObjectByTag("os_hen_cal");
    object oHenKai = GetNearestObjectByTag("os_hen_kai");
    object oHenTrp = GetNearestObjectByTag("os_hen_trp");
    object oHenJab = GetNearestObjectByTag("os_hen_jab");
    object oPC = GetFirstPC();
    if(GetIsObjectValid(oCal))
    {
        SetLocalInt(oCal,"OS_SURRENDER",10);
        AssignCommand(oCal,ClearAllActions(TRUE));
        AssignCommand(GetLastDamager(oCal),ClearAllActions(TRUE));
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oCal,SurrenderToEnemies());
        if(GetIsObjectValid(oHenKai))
        {
            AssignCommand(oHenKai,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenKai,oCal);
        }
        if(GetIsObjectValid(oHenJab))
        {
            AssignCommand(oHenJab,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenJab,oCal);
        }
        if(GetIsObjectValid(oHenTrp))
        {
            AssignCommand(oHenTrp,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenTrp,oCal);
        }
        ClearPersonalReputation(oPC, oCal);
        AssignCommand(oCal,SpeakOneLinerConversation());
    }
    if(GetIsObjectValid(oKai))
    {
        SetLocalInt(oKai,"OS_SURRENDER",10);
        AssignCommand(oKai,ClearAllActions(TRUE));
        AssignCommand(GetLastDamager(oKai),ClearAllActions(TRUE));
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oKai,SurrenderToEnemies());
        if(GetIsObjectValid(oHenCal))
        {
            AssignCommand(oHenCal,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenCal,oKai);
        }
        if(GetIsObjectValid(oHenJab))
        {
            AssignCommand(oHenJab,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenJab,oKai);
        }
        if(GetIsObjectValid(oHenTrp))
        {
            AssignCommand(oHenTrp,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenTrp,oKai);
        }
        ClearPersonalReputation(oPC, oKai);
        DelayCommand(0.1,AssignCommand(oKai,SpeakOneLinerConversation()));
    }
    if(GetIsObjectValid(oJab))
    {
        SetLocalInt(oJab,"OS_SURRENDER",10);
        AssignCommand(oJab,ClearAllActions(TRUE));
        AssignCommand(GetLastDamager(oJab),ClearAllActions(TRUE));
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oJab,SurrenderToEnemies());
        if(GetIsObjectValid(oHenKai))
        {
            AssignCommand(oHenKai,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenKai,oJab);
        }
        if(GetIsObjectValid(oHenCal))
        {
            AssignCommand(oHenCal,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenCal,oJab);
        }
        if(GetIsObjectValid(oHenTrp))
        {
            AssignCommand(oHenTrp,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenTrp,oJab);
        }
        ClearPersonalReputation(oPC, oJab);
        DelayCommand(0.2,AssignCommand(oJab,SpeakOneLinerConversation()));
    }
    if(GetIsObjectValid(oTrip))
    {
        SetLocalInt(oTrip,"OS_SURRENDER",10);
        AssignCommand(oTrip,ClearAllActions(TRUE));
        AssignCommand(GetLastDamager(oTrip),ClearAllActions(TRUE));
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oTrip,SurrenderToEnemies());
        if(GetIsObjectValid(oHenKai))
        {
            AssignCommand(oHenKai,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenKai,oTrip);
        }
        if(GetIsObjectValid(oHenJab))
        {
            AssignCommand(oHenJab,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenJab,oTrip);
        }
        if(GetIsObjectValid(oHenCal))
        {
            AssignCommand(oHenCal,ClearAllActions(TRUE));
            ClearPersonalReputation(oHenCal,oTrip);
        }
        ClearPersonalReputation(oPC, oTrip);
        DelayCommand(0.3,AssignCommand(oTrip,SpeakOneLinerConversation()));
    }
}

//::///////////////////////////////////////////////
//:: q3_GiveWeapon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks to see what weapon the PC can use
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void q3_GiveWeapon()
{
    object oPC = GetFirstPC();
    object oWeapon;
    if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL,oPC)
        || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF,oPC))
    {
        oWeapon = CreateItemOnObject("nw_wswls001",oPC);
        //creates basic long sword
    }
    else if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC,oPC))
    {
        oWeapon = CreateItemOnObject("nw_wswbs001",oPC);
        //creates bastard sword
    }
    else if(GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE,oPC)
        || GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID,oPC)
        || GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK,oPC)
        || GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE,oPC)
        || GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD,oPC))
    {
        oWeapon = CreateItemOnObject("nw_wswdg001",oPC);
        //creates basic dagger
    }
    if(GetIsObjectValid(oWeapon))
    {
        DelayCommand(0.5,AssignCommand(oPC,ActionEquipItem(oWeapon,INVENTORY_SLOT_RIGHTHAND)));
    }
    else
    {
        AssignCommand(oPC,SpeakString("Object not valid"));
    }
}

//::///////////////////////////////////////////////
//:: q2_LockCaves
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    locks the quester caves after the election is over
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////
void q2_LockCaves()
{
    object oUndead = GetObjectByTag("q1ab_at_q3af");
    AssignCommand(oUndead,ActionCloseDoor(oUndead));
    SetLocked(oUndead,TRUE);
    object oDwarf = GetObjectByTag("q1_gate_q3d2");
    SetLocked(oDwarf,TRUE);
    AssignCommand(oDwarf,ActionCloseDoor(oDwarf));
    object oKobold = GetObjectByTag("q1_gate_q3j");
    SetLocked(oKobold,TRUE);
    AssignCommand(oKobold,ActionCloseDoor(oKobold));
    object oManticore = GetObjectByTag("q1ab_at_q3ah");
    AssignCommand(oManticore,ActionCloseDoor(oManticore));
    SetLocked(oManticore,TRUE);
}

