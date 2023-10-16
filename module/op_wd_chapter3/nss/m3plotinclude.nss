//::///////////////////////////////////////////////
//:: Chapter 3 Include File
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  This is the main include file for the entire plot.
*/
//:://////////////////////////////////////////////
//:: Created By:         Brent
//:: Created On:         November 2001
//:://////////////////////////////////////////////

// * Constants

int M3Q2_SIEGEENGINESGONE = 10;
string M3Q2A11_REWARD2_PERSUASION ="NW_ASHMSW004"; // Hearth Shield
string M3Q2A11_REWARD3_PERSUASION ="NW_WAXMBT003"; // Axe of Dead Illusk
string M3Q2A11_PLAGUE_CURE ="M3Q2A14_CURE"; // Plague Cure
string M3Q2C06_GALIA_EXTRA_REWARD = "NW_IT_SPSCROL086";
string M3Q2A05YUSAMHIGH  ="M3Q1_YUSAMRING";
string M3Q2A05YUSAMMID   ="NW_IT_MRING002";
string M3Q2A05YUSAMLOW   ="NW_IT_MRING002";
string M3Q2D8ZOKANSPEAR = "NW_WPLMSS010"; // Just a generic +2 spear he gives out
// * Functions

int DoesPlayerHave(object oPC, string sTag)
{
object oItem = GetItemPossessedBy(oPC, sTag);
    if (GetIsObjectValid(oItem) == FALSE)
        return FALSE;
    return TRUE;
}
void TakeAndDestroy(object oPC, string sTag)
{
 object oItem = GetItemPossessedBy(oPC, sTag);
    if (GetIsObjectValid(oItem) == TRUE)
    {
      DestroyObject(oItem);
    }
}

// *
// *
// *
int HaveAnyWord(object oPlayer)
{
    int iResult = FALSE;
    object oWord = OBJECT_INVALID;

    if (GetIsObjectValid(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER1")) == TRUE
       && GetLocalInt(OBJECT_SELF, GetTag(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER1"))) == FALSE)
    {
        oWord = GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER1");
        iResult = TRUE;
    }
    else
    if (GetIsObjectValid(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER2")) == TRUE
           && GetLocalInt(OBJECT_SELF, GetTag(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER2"))) == FALSE)
    {
        oWord = GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER2");
        iResult = TRUE;
    }
    else
    if (GetIsObjectValid(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER3")) == TRUE
           && GetLocalInt(OBJECT_SELF, GetTag(GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER3"))) == FALSE)
    {
        oWord = GetItemPossessedBy(oPlayer,"M3Q1_WORDPOWER3");
        iResult = TRUE;
    }

    SetLocalObject(OBJECT_SELF, "NW_G_M3Q1L_LASTWORD",oWord);

    if (iResult == TRUE)
    {
        // * May 2002: Brent: create a local with the name of the item
        // * tag for the word just taken. This way Aarin won't
        // * take multiples of the same word
        if (GetLocalInt(OBJECT_SELF, GetTag(oWord)) == TRUE)
        {
            iResult = FALSE;
        }
    }
    return (iResult);
}


// *
// * M3Q2
// *

int HasHeadOfSubCommand(object oPC)
{
    return GetIsObjectValid(GetItemPossessedBy(oPC, "M3Q2A14_ARNESS"));
}
void TakeHeadOfSubCommand(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q2A14_ARNESS");
    ActionTakeItem(oItem, oPC);
    DestroyObject(oItem);
    CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2A14_PHEAD1", GetLocation(GetObjectByTag("M3Q2A14_PHEAD1")));
}
int HasHeadOfCommand(object oPC)
{
    return GetIsObjectValid(GetItemPossessedBy(oPC, "M3Q2D08_ZOKAN"));
}
void TakeHeadOfCommand(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q2D08_ZOKAN");
    ActionTakeItem(oItem, oPC);
    DestroyObject(oItem);
    CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2A14_PHEAD2", GetLocation(GetObjectByTag("M3Q2A14_PHEAD2")));
}
int HasPlagueBlankets(object oPC)
{
    return GetIsObjectValid(GetItemPossessedBy(oPC, "M3Q2_A11BLANKETS"));
}

void TakePlagueBlankets(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q2_A11BLANKETS");
    ActionTakeItem(oItem, oPC);
    DestroyObject(oItem);
}
void GivePlagueBlankets(object oPC)
{
     CreateItemOnObject("M3Q2_A11BLANKETS", oPC);
}
int HasPlagueCure(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2A14_CURE");
}

void TakePlagueCure(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q2A14_CURE");
    ActionTakeItem(oItem, oPC);
    DestroyObject(oItem);

}

void GivePlayerYusamToken(object oPC)
{
     CreateItemOnObject("M3Q2_D08_DREAM", oPC);
}
int HasYusamToken(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2_D08_DREAM");
}
void TakeYusamToken(object oPC)
{object oItem = GetItemPossessedBy(oPC, "M3Q2_D08_DREAM");
    if (GetIsObjectValid(oItem) == TRUE)
    {
      DestroyObject(oItem);
    }
}

string GetDamasJournal()
{
    return "M3Q2_A11_DAMAS";
}

int ElkChiefDead()
{
    return !GetIsObjectValid(GetObjectByTag("Zokan3Q21"));
}
void BretGiveRing(object oPC)
{
    CreateItemOnObject("M3Q2A10BRETBAND", oPC);
}
void TakeBretRing(object oPC)
{
object oItem = GetItemPossessedBy(oPC, "M3Q2A10BRETBAND");
    if (GetIsObjectValid(oItem) == TRUE)
    {
      DestroyObject(oItem);
    }
}
 // * Returns True if Bret still has his bracelet
 // * that he gives as a reward to a player
int DoesBretHaveHisBraceletStill()
{
  object oItem = GetItemPossessedBy(OBJECT_SELF, "M3Q2_A10BRACELET");
    if (GetIsObjectValid(oItem) == FALSE)
        return FALSE;
    return TRUE;
}
void BretGiveBracelet(object oPC)
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "M3Q2_A10BRACELET");
    if (GetIsObjectValid(oItem) == FALSE)
        return;

    DestroyObject(oItem);
    CreateItemOnObject("M3Q2_A10BRACELET", oPC);
}

int DoesPlayerHaveBretsRing(object oPC)
{
 object oItem = GetItemPossessedBy(oPC, "M3Q2A10BRETBAND");
    if (GetIsObjectValid(oItem) == FALSE)
        return FALSE;
    return TRUE;
}

void EckelGiveNote(object oPC)
{
    CreateItemOnObject("M3Q2A10ECKNOTE", oPC);
}

int DoesPlayerHaveEckelNote(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2A10ECKNOTE");
}

void TakeEckelNote(object oPC)

{
   TakeAndDestroy(oPC,"M3Q2A10ECKNOTE");
}

// * this feather is given by either the captured shaman
// * or Yusam to allow entrance into the Elk Tribe Fortress

void GiveShamanFeather(object oPC)
{
    CreateItemOnObject("M3Q2_B07_FEATHE", oPC);
}

int DoesPlayerHaveShamanFeather(object oPC)
{
    return DoesPlayerHave(oPC,"M3Q2_B07_FEATHE");
}


int HasVaathHead(object oPC)
{
  object oItem = GetItemPossessedBy(oPC, "M3Q3_A02VAATH");
    if (GetIsObjectValid(oItem) == FALSE)
        return FALSE;
    return TRUE;
}
void GuzudGiveHead(object oPC)
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "M3Q3_A02GUZUD");
    if (GetIsObjectValid(oItem) == FALSE)
        return;

    DestroyObject(oItem);
    CreateItemOnObject("M3Q3_A02GUZUD", oPC);
}



//
// * Get Functions
// *
object GetQ2D08FortDoor()
{
    return GetObjectByTag("M3Q2D01FortGate");
}

object GetZokanPlace()
{

    return GetObjectByTag("M3Q2D08ZokPlace");
}


int PlayerHasMyBook(object oPC)
{
    if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK1")
    {
        return DoesPlayerHave(oPC,"M3Q2D_BOOK_1");
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK2")
    {
        return DoesPlayerHave(oPC,"M3Q2D_BOOK_2");
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK3")
    {
        return DoesPlayerHave(oPC,"M3Q2D_BOOK_3");
    }

    return FALSE;
}
void PlaceMyBook(object oPC)
{
    if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK1")
    {
        TakeAndDestroy(oPC,"M3Q2D_BOOK_1");
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK2")
    {
        TakeAndDestroy(oPC,"M3Q2D_BOOK_2");
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK3")
    {
        TakeAndDestroy(oPC,"M3Q2D_BOOK_3");
    }
}

// * opens the door for the M3Q2D map puzzles
void OpenMyDoor()
{
    if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK1")
    {
        AssignCommand(GetObjectByTag("M3Q2D_VAULT1"), ActionOpenDoor(OBJECT_SELF));
        SetLocked(GetObjectByTag("M3Q2D_VAULT1"), FALSE);
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK2")
    {
        AssignCommand(GetObjectByTag("M3Q2D_VAULT2"), ActionOpenDoor(OBJECT_SELF));
        SetLocked(GetObjectByTag("M3Q2D_VAULT2"), FALSE);
    }
    else if (GetTag(OBJECT_SELF) == "M3Q2D_BOOK3")
    {
        AssignCommand(GetObjectByTag("M3Q2D_VAULT3"), ActionOpenDoor(OBJECT_SELF));
        SetLocked(GetObjectByTag("M3Q2D_VAULT3"), FALSE);
    }

}

//::///////////////////////////////////////////////
//:: GetElkTribePeaceful
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true, if player already
    tried to speak with one of them and
    is being escorted to Zokan.
    Does this check by using the invisible
    faction object and see if it hates player
    or not. (Faction is set to Friend when
    player gets escorted).
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int GetElkTribePeaceful(object oPC)
{
    return  GetIsFriend(GetObjectByTag("M3Q2DFACTIONOBJ"), oPC);
}

void SetElkTribePeaceful(object oPC)
{
    object oElkFaction = GetObjectByTag("M3Q2DFACTIONOBJ");
    AdjustReputation(oPC,oElkFaction, 100);
    object oElk = GetFirstFactionMember(oElkFaction,FALSE);
    while(GetIsObjectValid(oElk))
    {
        AssignCommand(oElk,ClearAllActions());
        ClearPersonalReputation(oElk,oPC);
        oElk = GetNextFactionMember(oElkFaction);
    }
}

void SetAllElkTribePeaceful(object oPC)
{
    AdjustReputation(oPC,GetObjectByTag("M3Q2DFACTIONOBJ"), 100);
    AdjustReputation(oPC,GetObjectByTag("M3Q2D_FORTFACTION"),100);
    object oElkFaction =GetObjectByTag("M3Q2D_FORTFACTION");
    object oFortFaction = GetObjectByTag("M3Q2D_FORTFACGOOD");
    AdjustReputation(oFortFaction,oElkFaction,100);
    AdjustReputation(oElkFaction,oFortFaction,100);
    object oFort = GetFirstFactionMember(oFortFaction,FALSE);
    while(GetIsObjectValid(oFort))
    {
//        SpeakString("Fort");
        AssignCommand(oFort,ClearAllActions());
        AssignCommand(oFort,ClearPersonalReputation(oElkFaction,oFort));
        oFort = GetNextFactionMember(oFortFaction,FALSE);
    }
    object oElk = GetFirstFactionMember(oElkFaction,FALSE);
    while(GetIsObjectValid(oElk))
    {
//        SpeakString("Elk");
        AssignCommand(oElk,ClearAllActions());
        AssignCommand(oElk,ClearPersonalReputation(oFortFaction,oElk));
        AssignCommand(oElk,ClearPersonalReputation(oPC,oElk));
        if (GetTag(GetArea(oElk)) == "M3Q2MAP")
        {
//            SpeakString("Dead");
            DelayCommand(1.0,DestroyObject(oElk));
        }
        oElk = GetNextFactionMember(oElkFaction,FALSE);
    }
}

// * checks to see if the object has a time crystal
int HasTimeCrystal(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2FTIME_CRY");
}



// * Player has Ultarg seeds
int HasUtargSeedsOrNotebook(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2ULTARGSEED");
}

void GivePlayerSapphiraStuff(object oPC)
{
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"M3Q2FTIME_CRY"))==FALSE)
    {
        CreateItemOnObject("M3Q2FTIME_CRY", oPC);
    }
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"M3Q2ULTARGSEED"))==FALSE)
    {
        CreateItemOnObject("M3Q2ULTARGSEED", oPC);
    }
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"M3Q2F_BOOK_1"))==FALSE)
    {
        CreateItemOnObject("M3Q2F_BOOK_1", oPC);
    }

}

// * returns true if the player has the Ultarg seeds
int HaveUltargSeeds(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2ULTARGSEED");
}

// * gives nValue in gems to oPC
void GiveValueInGems(object oPC, int nValue)
{
    if (nValue <= 1000)
    {
        CreateItemOnObject("NW_IT_GEM010", oPC, Random(7) + 1);
    }
    else
    if (nValue > 1000 && nValue < 3000)
    {
        CreateItemOnObject("NW_IT_GEM005", oPC, Random(4) + 1);
    }
    else
    if (nValue >= 3000 && nValue < 7000)
    {
        CreateItemOnObject("NW_IT_GEM006", oPC, Random(4) + 1);
    }
    else
    {
        CreateItemOnObject("NW_IT_GEM005", oPC, Random(7) + 1);
    }
}


void CheckGlobeInUse(object oArea)
{
  object oPC = GetFirstObjectInArea(oArea);
  int nNumOfPC = 0;
  while (GetIsObjectValid(oPC) == TRUE)
  {
      if (GetObjectType(oPC) == OBJECT_TYPE_CREATURE && GetIsPC(oPC) == TRUE)
      {
        nNumOfPC ++;
      }
      oPC = GetNextObjectInArea(oArea);

  }
  // * there is always one player in the area (the guy who is leaving)
  if (nNumOfPC <= 1)
  {
    SetLocalInt(GetModule(), "NW_G_GLOBE_IN_USE",0);
  }
}

//::///////////////////////////////////////////////
//:: ChangeSGWeather
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Changes the weather in the snowglobe if the dwarves
    are hostile.  Updated every time the globe is entered.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori
//:: Created On:    March 7, 2002
//:://////////////////////////////////////////////

void ChangeSGWeather()
{
    object oArea = GetArea(GetObjectByTag("M3Q3C"));

    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1)
    {
        // * If dwarves angry, no weather
        SetWeather(oArea, WEATHER_CLEAR);

    }
    else if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10)
    {
        // * If dryads angry, snow
        SetWeather(oArea, WEATHER_SNOW);

    }
}

//::///////////////////////////////////////////////
//:: RefreshReputation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Refreshes the dryad/dwarf reputations.  Updated
    everytime the globe is entered.
*/
//:://////////////////////////////////////////////
//:: Created By:                 Brent
//:: Created On:                 January 2002
//:://////////////////////////////////////////////
void RefreshReputation()
{
    object oDryadFaction = GetObjectByTag("M3Q3CSnowDryad");
    object oDwarfFaction = GetObjectByTag("M3Q3CSnowDwarf");
    object oArwylFaction = GetObjectByTag("M3Q3C04_ARWYL");
    object oHoddFaction = GetObjectByTag("M3Q3C07_HODD");






    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10)
    {
        // * Make Dryads Angry, Dwarves Friendly
        AdjustReputation(GetPCSpeaker(), oDryadFaction, -100);
//        SetIsTemporaryEnemy(GetPCSpeaker(), oDryadFaction);
        AdjustReputation(GetPCSpeaker(), oArwylFaction, -100);
//        SetIsTemporaryEnemy(GetPCSpeaker(), oArwylFaction);

        AdjustReputation(GetPCSpeaker(), oDwarfFaction, 100);
//        SetIsTemporaryFriend(GetPCSpeaker(), oDwarfFaction);
        AdjustReputation(GetPCSpeaker(), oHoddFaction, 100);
//        SetIsTemporaryFriend(GetPCSpeaker(), oHoddFaction);
    }
    else if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1)
    {
        // * Make Dryads Friendly, Dwarves angry
        AdjustReputation(GetPCSpeaker(), oDryadFaction, 100);
//        SetIsTemporaryFriend(GetPCSpeaker(), oDryadFaction);
        AdjustReputation(GetPCSpeaker(), oArwylFaction, 100);
//        SetIsTemporaryFriend(GetPCSpeaker(), oArwylFaction);

        AdjustReputation(GetPCSpeaker(), oDwarfFaction, -100);
//        SetIsTemporaryEnemy(GetPCSpeaker(), oDwarfFaction);
        AdjustReputation(GetPCSpeaker(), oHoddFaction, -100);
//        SetIsTemporaryEnemy(GetPCSpeaker(), oHoddFaction);
    }

}

//::///////////////////////////////////////////////
//:: DecrementLocksOnDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Decrements the number of locks on door M3Q2F25
    When no locks remains the player can open the door
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

void DecrementLocksOnDoor()
{
    SetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING", GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING") - 1);
    if(GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING")==2)
    {
        AddJournalQuestEntry("M3Q2F_DOOROF3",10,GetLastUsedBy());
    }
    else if(GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING")==1)
    {
        AddJournalQuestEntry("M3Q2F_DOOROF3",20,GetLastUsedBy());
    }
    if(GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING")==0)
    {
        AddJournalQuestEntry("M3Q2F_DOOROF3",30,GetLastUsedBy());
    }

    effect eVis = EffectVisualEffect(VFX_IMP_RESTORATION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    ActionSpeakStringByStrRef(52981);
    object oDoor1 = GetObjectByTag("M3Q2F24MAGICDOOR",1);
    object oDoor2 = GetObjectByTag("M3Q2F24MAGICDOOR",2);
/*    if (GetArea(oDoor1) == GetObjectByTag("M3Q2G") && GetArea(OBJECT_SELF) == GetObjectByTag("M3Q2G"))
    {
        SetLocalInt(GetArea(oDoor2),"M3Q2FLOCKSREMAINING", GetLocalInt(GetArea(oDoor2),"M3Q2FLOCKSREMAINING") - 1);
    }*/


}


//::///////////////////////////////////////////////
//:: PlayerWearsTranslationAmulet(oPC)
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Returns true if the oPC is wearing a translation
   amulet
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////
int PlayerWearsTranslationAmulet(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    if (GetIsObjectValid(oItem) == TRUE)
    {
        return GetTag(oItem) == "M3Q2GTRANAM";
    }
    return FALSE;
}


// *
// *
// *

int PlayerHasLokarsRing(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q2G08RING");
}
void GivePlayerLokarRing(object oPC)
{
    CreateItemOnObject("M3Q2G08RING", oPC);
}

//::///////////////////////////////////////////////
//:: CreateGolem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////
void CreateGolem(int nGolem, int nVulnerable)
{

    string sWayPointName = "M3Q2FGOLEMSPWN" + IntToString(nGolem);
    // * stores the last vulnerable state of the golem
    // * checks here,if we are trying to build the same type of golem
    // * then there is no point.
    int nOldVulnerable = GetLocalInt(GetModule(),"NW_L_M3Q2_GOLEM" + IntToString(nGolem)  + "_LASTVULNERABLE");

//    SpeakString("nGolem = " + IntToString(nGolem));
//    SpeakString("nVulnerable = " + IntToString(nVulnerable));
//    SpeakString("nOld = " + IntToString(nOldVulnerable));


    // * First time, always create the golem (0 state)
    if ((nVulnerable != nOldVulnerable) || (nVulnerable == 0))
    {

        object oWayPoint = GetObjectByTag(sWayPointName);
        if (GetIsObjectValid(oWayPoint) == TRUE)
        {
            object oOldGolem = GetLocalObject(GetModule(),"NW_L_M3Q2_GOLEM" + IntToString(nGolem));
            if (GetIsObjectValid(oOldGolem) == TRUE)
            {
                // * Destroy the Old Golem
                DestroyObject(oOldGolem);
            }
            SetLocalInt(GetModule(),"NW_L_M3Q2_GOLEM" + IntToString(nGolem)  + "_LASTVULNERABLE", nVulnerable)                      ;
            object oNewGolem  = CreateObject(OBJECT_TYPE_CREATURE, "M3Q2FGolem" + IntToString(nVulnerable), GetLocation(oWayPoint));
            SetLocalObject(GetModule(),"NW_L_M3Q2_GOLEM" + IntToString(nGolem), oNewGolem);
        }
    }
}


//::///////////////////////////////////////////////
//:: CountFactionMembers
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

int CountFactionMembers(object oSource)
{
    object oMember = GetFirstFactionMember(oSource, FALSE);
    int nCount = 0;
    while ((GetIsObjectValid(oMember) == TRUE)/*  && (GetIsDead(oMember) == FALSE)*/)
    {
        oMember = GetNextFactionMember(oSource, FALSE);
        nCount++;
    }
   // SpeakString(IntToString(nCount));
    return nCount;
}


//::///////////////////////////////////////////////
//:: CreateC3Ale
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a bottle of ale on the player
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////
void CreateC3Ale(object oPC)
{
//    CreateItemOnObject(oPC,"");
    SpeakString("Make Andrew make some beer");
}


// * Handles Dwarf/Dryad respawning behavior
// * random percentage of doing different things
void RebirthBehavior(object oDwarf)
{
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oDwarf));
//    WP_Tolowersnowglobe
/*    int nRandom = Random(100) + 1;
    if (nRandom > 34 && nRandom < 67)
    {
        // * move to entrance
         location lLoc = GetLocation(GetObjectByTag("WP_Insidesnowglobe"));
        AssignCommand(oDwarf, ActionMoveToLocation(lLoc));
    }
    else if (nRandom >= 68  && nRandom <=100)
    {
        // * move to front of dragoncave
        location lLoc = GetLocation(GetObjectByTag("WP_Tolowersnowglobe"));
        AssignCommand(oDwarf, ActionMoveToLocation(lLoc));
    }*/
    //* IMPLICIT ELSE: do nothing
//    AssignCommand(oDwarf,
}


// *
// *  M3Q4
// *
int PlayerHasHillGiantChiefHead(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q4_C03_GIANT_H");
}
void TakeHillGiantChiefHead(object oPC)
{
    TakeAndDestroy(oPC, "M3Q4_C03_GIANT_H");
}
int PlayerHasKlauthsHead(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q4_F02_KLAUTH");
}
void TakeKlauthsHead(object oPC)
{
    TakeAndDestroy(oPC, "M3Q4_F02_KLAUTH");
}

int PlayerHasGolemPassAmulet(object oPC)
{
return DoesPlayerHave(oPC, "M3Q04_PASS");
}
int PlayerHasEmptyDragonSphere(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q04G_Sphere");

}

int PlayerHasFullOrDeadSphere(object oPC)
{
    return DoesPlayerHave(oPC, "M3Q04G_SPHERE2") || DoesPlayerHave(oPC, "M3Q04G_Sphere3");

}

//* Takes and destroy a 'dead' sphere, if one is present
int TakeDeadSphere(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q04G_SPHERE2");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
//* Takes and destroy a 'alive' sphere, if one is present
int TakeAliveSphere(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M3Q04G_Sphere3");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
int PlayerHasAnyDragonSphere(object oPC)
{
    return DoesPlayerHave(oPC,"M3Q04G_Sphere") ||  DoesPlayerHave(oPC,"M3Q04G_SPHERE2") ||     DoesPlayerHave(oPC,"M3Q04G_Sphere3");
}

int PlayerHasEggs(object oPC)
{
    return DoesPlayerHave(oPC,"M3Q4Dragon_Eggs");
}
void TakeEggs(object oPC)
{
    TakeAndDestroy(oPC, "M3Q4Dragon_Eggs");
}

void SleepingDragonAttacked()
{
   int i = 1;
   object oVis = GetNearestObjectByTag("M3Q4H02_DragonCage",OBJECT_SELF, i);
   while (GetIsObjectValid(oVis) == TRUE)
   {
    AssignCommand(oVis, SetIsDestroyable(TRUE));
    DestroyObject(oVis);
    i++;
    oVis = GetNearestObjectByTag("M3Q4H02_DragonCage",OBJECT_SELF, i);
   }
    object oDragon = GetNearestObjectByTag("M3Q04H_Dragon");
    SetLocalInt(oDragon, "NW_L_AWAKE", 1);
    AssignCommand(oDragon, DelayCommand(7.0, ChangeToStandardFaction(oDragon, STANDARD_FACTION_HOSTILE)));
    AssignCommand(oDragon, DelayCommand(7.1, ActionAttack(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC))));
}
void SleepingDragonAwoken()
{
   int i = 1;
   object oVis = GetNearestObjectByTag("M3Q4H02_DragonCage",OBJECT_SELF, i);
   while (GetIsObjectValid(oVis) == TRUE)
   {
    AssignCommand(oVis, SetIsDestroyable(TRUE));
    DestroyObject(oVis);
    i++;
    oVis = GetNearestObjectByTag("M3Q4H02_DragonCage",OBJECT_SELF, i);
   }
    object oDragon = GetNearestObjectByTag("M3Q04H_Dragon");
    SetLocalInt(oDragon, "NW_L_AWAKE", 1);
//    AssignCommand(oDragon, DelayCommand(7.0, ChangeToStandardFaction(oDragon, STANDARD_FACTION_HOSTILE)));
//    AssignCommand(oDragon, DelayCommand(7.1, ActionAttack(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC))));
}

// * shapeshift into Yuanti
void BecomeYuantiAndAttack()
{
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(29), OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "NW_L_ICHANGED", 1);
    SetLocalInt(GetModule(),"NW_G_M3Q04PLOTYUANTI", 2)  ;
  //  SignalEvent(GetNearestObjectByTag("M3Q04G13YUAN", OBJECT_SELF, 2), EventUserDefined(2050));
    DelayCommand(2.0,SpeakOneLinerConversation());
    DelayCommand(2.0,ActionAttack(oPC));
}


//* Haedraline locks the 'appropriate' door based  upon where the player retrieved the word
void HaedralineLocksDoor()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    object oDoor= OBJECT_INVALID;
    // * Creator Race Ruins Doors
    if (sAreaTag == "M3Q2F")
    {
        oDoor = GetNearestObjectByTag("M3Q2F24MAGICDOOR");
        AssignCommand(oDoor,ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);
    }
    else
    // * snow globe dragon cave door
    if (sAreaTag == "M3Q3CA")
    {
        oDoor = GetNearestObjectByTag("M3Q3CA01_OUT");
        AssignCommand(oDoor,ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);
    }
    else
    // * snow globe dragon cave door
    if (sAreaTag == "M3Q4HC")
    {
        oDoor = GetNearestObjectByTag("M3Q4WordDoor");
        AssignCommand(oDoor,ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);
    }

}
void HaedralineUnlocksDoor()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    object oDoor= OBJECT_INVALID;
    // * Creator Race Ruins Doors
    if (sAreaTag == "M3Q2F")
    {
        oDoor = GetNearestObjectByTag("M3Q2F24MAGICDOOR");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor, FALSE);
    }
    else
    // * snow globe dragon cave door
    if (sAreaTag == "M3Q3CA")
    {
        oDoor = GetNearestObjectByTag("M3Q3CA01_OUT");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor, FALSE);
    }
    else
    // * snow globe dragon cave door
    if (sAreaTag == "M3Q4HC")
    {
        oDoor = GetNearestObjectByTag("M3Q4WordDoor");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor, FALSE);
    }


}
// *
// * Locals On Players, Functions
// *
void SetPlayerAcceptedYusamQuest(object oPC)
{
    SetLocalInt(oPC, "NW_L_M3Q05SPOKEWITHPLAYER", 10);
}
int GetPlayerAcceptedYusamQuest(object oPC)
{
    if (GetLocalInt(oPC, "NW_L_M3Q05SPOKEWITHPLAYER") >= 10)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void RestoreEveryone()
{
    object oTarget = GetFirstPC();
    while(GetIsObjectValid(oTarget))
    {
        effect eBad = GetFirstEffect(oTarget);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget, eBad);
            }
            eBad = GetNextEffect(oTarget);
        }
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        if(nHeal > 0)
        {
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        }
        oTarget = GetNextPC();
    }
}


void DoDoorJump(object oWay, object oPC)
{
    if(GetIsPC(oPC) || GetIsObjectValid(GetMaster(oPC)))
    {
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oPC,1.0);
        DelayCommand(0.9,AssignCommand(oPC,ClearAllActions()));
        DelayCommand(1.0,AssignCommand(oPC,JumpToObject(oWay)));
    }
}
