//::///////////////////////////////////////////////
//:: Plot_Locals
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Contains all CONSTANTS and FUNCTIONS
    for all plot variables.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: July 2002
//:://////////////////////////////////////////////

// * CONSTANTS
int ORPHAN_INVALID = 0;
int ORPHAN_SET = 10;
int ORPHAN_SECOND_JOURNAL_ = 20;


// * GLOBAL FUNCTION DECLARATIONS
// * Check to see if PC is the HERO (the one who is supposed to be
// * getting the dreams
int IsPCHero(object oPC);

int PlotGetOrphan(int nConstant);
// * stores an integer on the area by default for this plot
void PuzzleSetConditionMet(int nCondition,object oStoreValue=OBJECT_INVALID);
int PuzzleGetConditionMet(int nCondition, object oStoreValue=OBJECT_INVALID);
// * OBJECT-SPECIFIC FUNCTION DECLARATIONS


// ********************************
// * GLOBAL FUNCTION IMPLEMENTATION
// ********************************

// * Check to see if PC is the HERO (the one who is supposed to be
// * getting the dreams - this is set in the very first cutscene
// * "mod_client_enter" script
int IsPCHero(object oPC)
{
    if (GetLocalInt(oPC, "nPCNumber") == 1)
        return TRUE;
    return FALSE;
}

//locals for Undermountain

void TamsilUpsetByPlayer(object oPC)
{
    SetLocalInt(oPC,"q2atamsiltalk", 99);
}

int TamsilHatesPlayer(object oPC)
{
    return GetLocalInt(GetModule(),"q2atamsiltalk")== 99;
}

int MhaereWontRentRoom(object oPC)
{
    return GetLocalInt(oPC,"NW_MHAERETALK")== 10;
}

void MhaereSpokeToPC(object oPC)
{
    SetLocalInt(oPC,"NW_MHAERETALK", 10);
}

int TamsilRanAwayOn(object oPC)
{
    if ((GetLocalInt(GetModule(),"NW_TAMSILGONE")== 20)||
           (GetLocalInt(GetModule(),"NW_TAMSILGONE")== 30))
        return TRUE;
    return FALSE;
}

int DoorNotOpenYetBuck(object oPC)
{
    return GetLocalInt(GetModule(),"NW_YPDOOR")== 0;
}

int GraybanOpenedDoor(object oPC)
{
    return GetLocalInt(GetModule(),"NW_YPDOOR")== 10;
}

void BuckOpenedDoor(object oPC)
{
    SetLocalInt(GetModule(),"NW_YPDOOR", 10);
}

int DurnanIsGone(object oPC)
{
    return GetLocalInt(GetModule(),"NW_TAMSILGONE")== 99;
}

void PlayerHelpsAdventurer(object oPC)
{
    SetLocalInt(oPC,"NW_BEGGARADVENTURER", 10);
}

void ArgaliAskedAboutItem(object oPC)
{
    SetLocalInt(oPC,"NW_ARGALIITEM",10);
}

void ArgaliToldAboutCloak(object oPC)
{
    SetLocalInt(oPC,"NW_ARGALIITEM",20);
}

void ArgaliSoldItemNow(object oPC)
{
    SetLocalInt(GetModule(),"NW_ARGALIITEM",10);
}

int ArgaliToldAboutCloakAlready(object oPC)
{
    return GetLocalInt(oPC,"NW_ARGALIITEM")== 20;
}

int ArgaliAskedAlready(object oPC)
{
    return GetLocalInt(oPC,"NW_ARGALIITEM")== 0;
}

int ArgaliNoSellCloak(object oPC)
{
    return GetLocalInt(GetModule(),"NW_ARGALIITEM")== 0;
}

int ArgaliSoldItem(object oPC)
{
    return GetLocalInt(GetModule(),"NW_ARGALIITEM")== 10;
}

void MotherSalinkaHatesPCs(object oPC)
{
    SetLocalInt(GetModule(),"NW_MOTHERSALINKA", 10);
}

void MotherSalinkaHatesPC(object oPC)
{
    SetLocalInt(oPC,"NW_MOTHERSALINKA", 10);
}

void SpokeToMotherSalinkaOnce(object oPC)
{
    SetLocalInt(oPC,"NW_MOTHERSALINKA", 5);
}

int IsMotherSalinkaMad(object oPC)
{
    return GetLocalInt(GetModule(),"NW_MOTHERSALINKA")== 10;
}

int IsMotherSalinkaMadAtPC(object oPC)
{
    return GetLocalInt(oPC,"NW_MOTHERSALINKA")== 10;
}

int HasPCSpokenToMotherSalinka(object oPC)
{
    return GetLocalInt(oPC,"NW_MOTHERSALINKA")== 5;
}

int FirstMeetProstitute(string szTag, object oPC)
{
    return GetLocalInt(oPC, szTag + "SPEAK")== 0;
}

void PCSpokeToProstituteOnce(string szTag, object oPC)
{
    SetLocalInt(oPC, szTag + "SPEAK", 10);
}

int SecondMeetProstitute(string szTag, object oPC)
{
    return GetLocalInt(oPC, szTag + "SPEAK")== 10;
}

void PCSpokeToProstituteTwice(string szTag, object oPC)
{
    SetLocalInt(oPC, szTag + "SPEAK", 20);
}

int ThirdMeetProstitute(string szTag, object oPC)
{
    return GetLocalInt(oPC, szTag + "SPEAK")== 20;
}

void PCSpokeToProstituteThrice(string szTag, object oPC)
{
    SetLocalInt(oPC, szTag + "SPEAK", 30);
}

int ProstituteIsInsulted(string szTag, object oPC)
{
    return GetLocalInt(oPC, szTag + "SPEAK")== 80;
}

void PCInsultedProstitute(string szTag, object oPC)
{
    SetLocalInt(oPC, szTag + "SPEAK", 80);
}

void PCSleptWithProstitute(string szTag, object oPC)
{
    SetLocalInt(oPC, szTag + "SPEAK", 99);
}
int ProstituteIsDone(string szTag, object oPC)
{
    return GetLocalInt(oPC, szTag + "SPEAK")== 99;
}

void PCMetCynn(object oPC)
{
    SetLocalInt(oPC,"NW_CYNNSPEAK", 10);
}

int HasPCMetCynnBefore(object oPC)
{
    return GetLocalInt(oPC,"NW_CYNNSPEAK")== 10;
}

void PCIsOnCynnsQuest(object oPC)
{
    SetLocalInt(GetModule(),"NW_CYNNQUEST", 10);
}

void PCKnowsCynnHusband()
{
    SetLocalInt(GetModule(), "X2_CYNNHUSBAND", 10);
}

int DoesPCKnowCynnHusband()
{
    if (GetLocalInt(GetModule(), "X2_CYNNHUSBAND") == 10)
        return TRUE;
    return FALSE;
}
int IsPCOnCynnsQuest(object oPC)
{
    return GetLocalInt(GetModule(),"NW_CYNNQUEST")> 0;
}

void PCGetQuestFromHusband()
{
    SetLocalInt(GetModule(), "X2_CYNNHUSBAND", 20);
}

int IsPCOnThomasQuest()
{
    if (GetLocalInt(GetModule(), "NW_CYNNHUSBAND") == 20)
        return TRUE;
    return FALSE;
}

int PCSolvedCynnsQuest(object oPC)
{
    return GetLocalInt(GetModule(),"NW_CYNNQUEST")== 99;
}
void SolveCynnsQuestGood()
{
    SetLocalInt(GetModule(), "NW_CYNNQUEST", 99);
}

int CynnsQuestOverBad(object oPC)
{
    return GetLocalInt(GetModule(),"NW_CYNNQUEST")== 80;
}

void CynnsQuestEndedBad(object oPC)
{
    SetLocalInt(GetModule(),"NW_CYNNQUEST", 80);
}

int ThomasIsDead(object oPC)
{
    return GetLocalInt(GetModule(),"X2_TOMDEAD")==1;
}

void PCOnlyGaveBeggarOneGold(object oPC)
{
    SetLocalInt(oPC,"NW_BEGGARADVENTURER", 5);
}

void PCToldBeggarOff(object oPC)
{
    SetLocalInt(oPC,"NW_BEGGARADVENTURER", 1);
}

int WasPCACheapBastard(object oPC)
{
    return GetLocalInt(oPC,"NW_BEGGARADVENTURER")== 5;
}

int PCIsColdHeartedJerk(object oPC)
{
    return GetLocalInt(oPC,"NW_BEGGARADVENTURER")== 1;
}

void PCHeardAboutUndermountain(object oPC)
{
    SetLocalInt(GetModule(),"NW_DURNANSTORY", 20);
}

void FairyToldOfOgre(object oPC)
{
    SetLocalInt(oPC,"XP_FAIRYOGREWAR", 10);
}

int PCKnowsOfOgreFairyWar(object oPC)
{
    return GetLocalInt(oPC,"XP_FAIRYOGREWAR")== 10;
}

void TamsilGavePCNote(object oPC)
{
    SetLocalInt(oPC,"q2atamsiltalk", 10);
}

void TethlanGoingToInn(object oPC)
{
    SetLocalInt(oPC,"NW_TETHLANTALK", 10);
    SetLocalInt(OBJECT_SELF,"NW_TETHLANINN",10);
}

int TethlanIsInYP(object oPC)
{
    return GetLocalInt(oPC,"NW_TETHLANTALK")== 10;
}

int TethlanIsInInn(object oPC)
{
    return GetLocalInt(OBJECT_SELF,"NW_TETHLANINN")== 10;
}

int TethlanDoesntKnowPC(object oPC)
{
    return GetLocalInt(oPC,"NW_TETHLANTALK")== 0;
}

int JeraIsInYP(object oPC)
{
    return GetLocalInt(oPC,"NW_JERATALK")== 10;
}

int JeraDoesntKnowPC(object oPC)
{
    return GetLocalInt(oPC,"NW_JERATALK")== 0;
}

void JeraGoingToInn(object oPC)
{
    SetLocalInt(oPC,"NW_JERATALK", 10);
    SetLocalInt(OBJECT_SELF,"NW_JERAINN",10);
}

int JeraIsInInn(object oPC)
{
    return GetLocalInt(OBJECT_SELF,"NW_JERAINN")== 10;
}

int BritDoesntKnowPC(object oPC)
{
    return GetLocalInt(oPC,"NW_BRITTALK")== 0;
}

int BritIsInYP(object oPC)
{
    return GetLocalInt(oPC,"NW_JERATALK")== 10;
}

void SetSkullportKnown(object oPC)
{
    SetLocalInt(GetModule(),"q2undermountainquest",60);
}


void SetMatronKnown(object oPC)
{
    SetLocalInt(GetModule(),"q2undermountainquest",40);
}


void BucksArmOpen(object oPC)
{
    SetLocalInt(GetModule(),"NW_L_BUCKSARM",10);
}

void BuckNowSad(object oPC)
{
    SetLocalInt(GetModule(),"NW_L_BUCKSARM",99);
}

int BuckIsSad(object oPC)
{
    return GetLocalInt(GetModule(),"NW_L_BUCKSARM")==99;
}

//locals for houses

void SetDrowOffer500(object oPC)
{
    SetLocalInt(oPC,"NW_L_DROWOFFERED",10);
}

void SetDrowOffer700(object oPC)
{
    SetLocalInt(oPC,"NW_L_DROWOFFERED",20);
}

void SetDrowOffer1000(object oPC)
{
    SetLocalInt(oPC,"NW_L_DROWOFFERED",30);
}

void SetDuergarOffer500(object oPC)
{
    SetLocalInt(oPC,"NW_L_DUEGAROFFERED",10);
}

void SetDuergarOffer700(object oPC)
{
    SetLocalInt(oPC,"NW_L_DUEGAROFFERED",20);
}

void SetDuergarOffer1000(object oPC)
{
    SetLocalInt(oPC,"NW_L_DUEGAROFFERED",30);
}

void SetIllithidOffer500(object oPC)
{
    SetLocalInt(oPC,"NW_L_ILLITHIDOFFERED",10);
}

void SetIllithidOffer700(object oPC)
{
    SetLocalInt(oPC,"NW_L_ILLITHIDOFFERED",20);
}

void SetIllithidOffer1000(object oPC)
{
    SetLocalInt(oPC,"NW_L_ILLITHIDOFFERED",30);
}

int GetDrowOffer(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DROWOFFERED")!=0;
}

int GetIllithidOffer(object oPC)
{
    return GetLocalInt(oPC,"NW_L_ILLITHIDOFFERED")!=0;
}

int GetDuergarOffer(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DUEGAROFFERED")!=0;
}

int GetDuergarOffer500(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DUEGAROFFERED")==10;
}

int GetDuergarOffer700(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DUEGAROFFERED")==20;
}

int GetDuergarOffer1000(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DUEGAROFFERED")==30;
}

int GetDrowOffer700(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DROWOFFERED")==20;
}

int GetIllithidOffer700(object oPC)
{
    return GetLocalInt(oPC,"NW_L_ILLITHIDOFFERED")==20;
}


int OnSmallJobDuergar(object oPC)
{
    return GetLocalInt(oPC,"NW_L_SMALLJOBTAKEN")==0;

}

void SetOnSmallJobDuergar(object oPC)
{
    SetLocalInt(oPC,"NW_L_SMALLJOBTAKEN",20);
}

void SetDoneSmallJobDuergar(object oPC)
{
    SetLocalInt(oPC,"NW_L_SMALLJOBTAKEN",20);
}

int OnDracolichQuestDuergar(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DRACOQUESTTAKEN")==20;
}

void SetOnDracolichQuestDuergar(object oPC)
{
    SetLocalInt(oPC,"NW_L_DRACOQUESTTAKEN",20);
}

void SetNoLoveForOnasik(object oPC)
{
    SetLocalInt(oPC,"ONASIKMINORROMANCEPLOT",99);
}

void SetSomeLoveForOnasik(object oPC)
{
    SetLocalInt(oPC,"ONASIKMINORROMANCEPLOT",10);
}

int OnEPFireQuest(object oPC)
{
    return GetLocalInt(oPC,"NW_L_DUEGAROFFERED")!=0;
    return GetLocalInt(oPC,"NW_L_DROWOFFERED")!=0;
    return GetLocalInt(oPC,"NW_L_ILLITHIDOFFERED")!=0;
}


//locals for svirf village
int SvirfMonsterIsDead(object oPC)
{
    return GetLocalInt(GetModule(),"NW_L_SVIRFMONSTER")==30;
}

int DuergarAreAllies(object oPC)
{
    return GetLocalInt(GetModule(),"DUERGARSVIRFALLIES")==99;
}

int SvirfMonsterHunt(object oPC)
{
    return GetLocalInt(GetModule(),"NW_L_SVIRFMONSTER")==20;
}

int IsFirstTimeMeetRed(object oPC)
{
    return GetLocalInt(oPC,"NW_L_SVIRFMONSTER")==0;
}

int FirstTimeSpeakClati(object oPC)
{
    return GetLocalInt(GetModule(),"CLATITALK")==0;
}

void MetClatiNow(object oPC)
{
    SetLocalInt(oPC,"CLATITALK",10);
}

int FirstTimeMeetTwill(object oPC)
{
    return GetLocalInt(GetModule(),"NW_L_SVIRFMONSTER")==0&&
           GetLocalInt(oPC,"TWILLTALK")==0;
}

void MetTwillNow(object oPC)
{
    SetLocalInt(oPC,"TWILLTALK",10);
}

void TwillIsHappy(object oPC)
{
    SetLocalInt(oPC,"TWILLTALK",20);
}

int IsTwillHappy(object oPC)
{
    return GetLocalInt(oPC,"TWILLTALK")==20;
}

void MonsterHuntOn(object oPC)
{
    SetLocalInt(GetModule(),"NW_L_SVIRFMONSTER",20);
}

void SetLetterDeliveredSvirfs(object oPC)
{
    SetLocalInt(oPC,"LETTERDELIVERY",30);
}

int CheckIfClatiBack(object oPC)
{
    return GetLocalInt(GetModule(),"NW_L_SVIRFMONSTER")==60;
}

void SetSvirfMonsterPlotDone(object oPC)
{
    SetLocalInt(GetModule(),"NW_L_SVIRFMONSTER",99);
}

void PCKnowsOfHups(object oPC)
{
    SetLocalInt(oPC,"HUPSKNOWN",10);
}

int CheckPCKnowsOfHups(object oPC)
{
    return GetLocalInt(oPC,"HUPSKNOWN")==10;
}

int NoMaterialsReturned(object oPC)
{
    return GetLocalInt(GetModule(),"BUILDSUIT")==10;
}

int FirstTimeMetHups(object oPC)
{
    return GetLocalInt(oPC,"HUPSTALK")==0;
}

int AlreadyMetHups(object oPC)
{
    return GetLocalInt(oPC,"HUPSTALK")==10;
}

int CollectingMaterials(object oPC)
{
    return GetLocalInt(GetModule(),"BUILDSUIT")==10;
}

int SuitIsBuilt(object oPC)
{
    return GetLocalInt(GetModule(),"BUILDSUIT")==99;
}

void QuartzIsCollected(object oPC)
{
    SetLocalInt(oPC,"QUARTZDONE",10);
}











//Locals for Fire Elemental Plane
int ZaamanNotMet(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==0;
}

void ZaamanNowMet(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",10);
}

void ZaamanGavePlot(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",20);
}

void ZaamanGaveTabletPlot(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",30);
}

int ZaamanMetOnce(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==10;
}

int ZaamanGaveReward(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==99;
}

int ZaamanGotTablets(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==70;
}

int ZaamanNoTrust(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==20;
}

int HastefelToldPlan(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==40;
}

int HastefelWon(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==75;
}

int PCHasTablets(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSPLOT")==60;
}

void ZaamanRewardsPC(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",99);
}

void HastefelRewardsPC(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",80);
}



void GaveZaamanTablets(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",70);
}

void SetHastefelToldPlan(object oPC)
{
    SetLocalInt(GetModule(),"TABLETSPLOT",40);
}

int OneTabletFound(object oPC)
{
    return GetLocalInt(GetModule(),"TABLETSFOUND")==10;
}

int HastefelNotMet(object oPC)
{
    return GetLocalInt(GetPCSpeaker(),"HASTEFELTALK")!=10;
}

int HastefelNowMet(object oPC)
{
    return GetLocalInt(GetPCSpeaker(),"HASTEFELTALK")==10;
}

void SetHastefelMet(object oPC)
{
    SetLocalInt(GetPCSpeaker(),"HASTEFELTALK",10);
}

void TheHuntIsOn(object oPC)
{
    SetLocalInt(GetModule(),"NW_BRASSDRAGON",10);
    SetLocalInt(oPC,"NW_TALKBRASSDRAGON",10);
}

int FirstMeetXik(object oPC)
{
    return GetLocalInt(oPC,"NW_TALKBRASSDRAGON")==0;
}

void MetXikNoHunt(object oPC)
{
    SetLocalInt(oPC,"NW_TALKBRASSDRAGON",10);
}

int SecondMeetXik(object oPC)
{
    return GetLocalInt(oPC,"NW_TALKBRASSDRAGON")==10&&
           GetLocalInt(GetModule(),"NW_BRASSDRAGON")!=10;
}

int NeedFeedXik(object oPC)
{
    return GetLocalInt(oPC,"NW_TALKBRASSDRAGON")==10&&
           GetLocalInt(GetModule(),"NW_BRASSDRAGON")==10;
}

void SetMabePlotOn(object oPC)
{
    SetLocalInt(GetModule(),"NW_KILLDADDY",10);
}

void SetMabePlanB(object oPC)
{
    SetLocalInt(GetModule(),"NW_KILLDADDY",20);
}

int FirstTimeMetMabe(object oPC)
{
    return GetLocalInt(GetModule(),"NW_KILLDADDY")==0;
}

int NextTimeMetMabe(object oPC)
{
    return GetLocalInt(GetModule(),"NW_KILLDADDY")==10;
}

int MabeFatherDead(object oPC)
{
    return GetLocalInt(GetModule(),"NW_KILLDADDY")==99;
}

void SetMabePlotDone(object oPC)
{
    SetLocalInt(GetModule(),"NW_KILLDADDY",99);
}

void SetMabeWontTell(object oPC)
{
    SetLocalInt(GetModule(),"NW_KILLDADDY",80);
}

int MabeWontTell(object oPC)
{
    return GetLocalInt(GetModule(),"NW_KILLDADDY")==80;
}

int MabeYelledMurder(object oPC)
{
    return GetLocalInt(GetModule(),"NW_KILLDADDY")==20;
}

void NiffIsFriendNow(object oPC)
{
    SetLocalInt(oPC,"NW_NIFFSTUFF",10);
}

void NiffIsNotFriendNow(object oPC)
{
    SetLocalInt(oPC,"NW_NIFFSTUFF",20);
}

int IsNiffAFriend(object oPC)
{
    return GetLocalInt(oPC,"NW_NIFFSTUFF")==10;
}

int IsNiffMet(object oPC)
{
    return GetLocalInt(oPC,"NW_NIFFSTUFF")==0;
}

void NiffWants1000Gold(object oPC)
{
    SetLocalInt(oPC,"NW_NIFFSTUFF",30);
}

int NiffWantsGold(object oPC)
{
    return GetLocalInt(oPC,"NW_NIFFSTUFF")==30;
}

void SetBerarakPlotOn(object oPC)
{
    SetLocalInt(oPC,"NW_EARTHSLAVE",10);
}

void SetBerarakPlotDone(object oPC)
{
    SetLocalInt(oPC,"NW_EARTHSLAVE",99);
}

// Shattered Mirror Plot Locals

void SetColonusPlotAccepted(object oPC)
{
    SetLocalInt(GetModule(),"NW_SHATTEREDMIRROR",20);
}

void SetColonusPlotHeard(object oPC)
{
    SetLocalInt(GetModule(),"NW_SHATTEREDMIRROR",10);
}

void SetColonusAttackedOnce(object oPC)
{
    SetLocalInt(oPC,"NW_COLONUS",10);
}

int ColonusAttackedByPC1(object oPC)
{
    return GetLocalInt(oPC,"NW_COLONUS")==10;
}

int ColonusAttackedByPC2(object oPC)
{
    return GetLocalInt(oPC,"NW_COLONUS")==20;
}

int ColonusNotMet(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")==0;
}

void SetColonusAttackedTwice(object oPC)
{
    SetLocalInt(oPC,"NW_COLONUS",20);
}

int ColonusPlotNotAccepted(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")< 20;
}

int ColonusGavePlot(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")> 10;
}

int PCHasMetTwoAasimar(object oPC)
{
    return GetLocalInt(oPC,"NW_SHATTEREDMIRROR")== 40;
}

int PCHasMetThreeAasimar(object oPC)
{
    return GetLocalInt(oPC,"NW_SHATTEREDMIRROR")== 50;
}

int PCPlacedMirrorPiece(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")> 50;
}

int PCHasHeardColStory(object oPC)
{
    return GetLocalInt(oPC,"NW_COLONUSSTORY")!=10;
}

void SetColonusToldStory(object oPC)
{
    SetLocalInt(oPC,"NW_COLONUSSTORY",10);
}

int PCHasHeardColStory2(object oPC)
{
    return GetLocalInt(oPC,"NW_COLONUSSTORY")==10;
}

int AssimarReturnedHome(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")== 99;
}

int AssimarBecameMonsters(object oPC)
{
    return GetLocalInt(GetModule(),"NW_SHATTEREDMIRROR")== 80;
}

int SpokeToGuardBefore(object oPC)
{
    return GetLocalInt(oPC,"NW_MASSIVEGUARD")==10;
}

void SpokeToMassiveGuard(object oPC)
{
    SetLocalInt(oPC,"NW_MASSIVEGUARD",10);
}
//::///////////////////////////////////////////////
//:: Name  SpokeToAasimar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     30 = spoke to one
     40 = spoke to two
     50 = spoke to three or more
     These are set on the pc for talking to Colonus
     about what has happened here.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////

void SpokeToAssimar(object oPC)
{
    if (GetLocalInt(oPC,"NW_SHATTEREDMIRROR")==30)
    SetLocalInt(oPC,"NW_SHATTEREDMIRROR",40);
    else
    if (GetLocalInt(oPC,"NW_SHATTEREDMIRROR")==40)
    SetLocalInt(oPC,"NW_SHATTEREDMIRROR",50);
    else
    if (GetLocalInt(oPC,"NW_SHATTEREDMIRROR")>=50)
    SetLocalInt(oPC,"NW_SHATTEREDMIRROR",50);
    else
    if (GetLocalInt(oPC,"NW_SHATTEREDMIRROR")<=30)
    SetLocalInt(oPC,"NW_SHATTEREDMIRROR",30);
}

int ShaoriSpokeNone(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==0;
}

int ShaoriSpokeOnce(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==10;
}

int ShaoriSpokeTwice(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==20;
}

int ShaoriSpokeThrice(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==30;
}

int ShaoriSpokeFourTimes(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==40;
}

int ShaoriSpokeFiveTimes(object oPC)
{
    return GetLocalInt(oPC,"NW_SHAORISPOKE")==50;
}

//::///////////////////////////////////////////////
//:: Name  AdvanceShaoriSpokenTo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     10 = spoke to once
     20 = spoke to twice
     30 = spoke to three times
     40 = spoke to four times
     50 = spoke to five times
     These are set on the pc for talking to Colonus
     about what has happened here.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////

void AdvanceShaoriSpokenTo(object oPC)
{
    if (GetLocalInt(oPC,"NW_SHAORISPOKE")==0)
    SetLocalInt(oPC,"NW_SHAORISPOKE",10);
    else
    if (GetLocalInt(oPC,"NW_SHAORISPOKE")==10)
    SetLocalInt(oPC,"NW_SHAORISPOKE",20);
    else
    if (GetLocalInt(oPC,"NW_SHAORISPOKE")==20)
    SetLocalInt(oPC,"NW_SHAORISPOKE",30);
    else
    if (GetLocalInt(oPC,"NW_SHAORISPOKE")==30)
    SetLocalInt(oPC,"NW_SHAORISPOKE",40);
    else
    if (GetLocalInt(oPC,"NW_SHAORISPOKE")==40)
    SetLocalInt(oPC,"NW_SHAORISPOKE",50);
}

void ApprenticeIsCured(object oPC)
{
    SetLocalInt(GetModule(),"NW_WIZAPP",99);
}

int MetNyphratesBefore(object oPC)
{
    return GetLocalInt(oPC,"NW_NYPHRATESSPOKE")==10;
}

void LookingForCrap(object oPC)
{
    SetLocalInt(oPC,"NW_FINDHOLEYGRAIL",10);
}

int NotLookingForCrap(object oPC)
{
    return GetLocalInt(oPC,"NW_FINDHOLEYGRAIL")==0;
}

int IsLookingForCrap(object oPC)
{
    return GetLocalInt(oPC,"NW_FINDHOLEYGRAIL")==10;
}

void SpokeToJesterOnce(object oPC)
{
    SetLocalInt(oPC,"NW_JESTERTALK",10);
}
void SpokeToJesterTwice(object oPC)
{
    SetLocalInt(oPC,"NW_JESTERTALK",20);
}

int JesterNeverMet(object oPC)
{
    return GetLocalInt(oPC,"NW_JESTERTALK")==0;
}

int JesterMetOnce(object oPC)
{
    return GetLocalInt(oPC,"NW_JESTERTALK")==10;
}

int JesterMetTwice(object oPC)
{
    return GetLocalInt(oPC,"NW_JESTERTALK")==20;
}

void FoundCrap(object oPC)
{
    SetLocalInt(oPC,"NW_FINDHOLEYGRAIL",99);
}

void NowMetNyprates(object oPC)
{
    SetLocalInt(oPC,"NW_NYPHRATESSPOKE",10);
}

int SpokeToPetyrOnce(object oPC)
{
    return GetLocalInt(oPC,"NW_PETYRTALK")==20;
}

void RiviatchIsWaitingForNames(object oPC)
{
    SetLocalInt(oPC,"NW_RIVIATCHTALK",10);
}

void RiviatchIsWaitingForBook(object oPC)
{
    SetLocalInt(oPC,"NW_RIVIATCHTALK",20);
}

int IsRiviatchWaitingForNames(object oPC)
{
    return GetLocalInt(oPC,"NW_RIVIATCHTALK")==10;
}

int FirstMeetRiviatch(object oPC)
{
    return GetLocalInt(oPC,"NW_RIVIATCHTALK")==0;
}

int IsRiviatchWaitingForBook(object oPC)
{
    return GetLocalInt(oPC,"NW_RIVIATCHTALK")==20;
}

int DarkfistGavePCBook(object oPC)
{
    return GetLocalInt(oPC,"NW_DARKFISTGAME")==99;
}

int IsDarkfistGameOn(object oPC)
{
    return GetLocalInt(oPC,"NW_DARKFISTGAME")==10;
}

void DarkfistGameDone(object oPC)
{
    SetLocalInt(oPC,"NW_DARKFISTGAME",99);
}

void RiviatchHasBook(object oPC)
{
    SetLocalInt(oPC,"NW_RIVIATCHTALK",99);
}

int RiviatchHasBookNow(object oPC)
{
    return GetLocalInt(oPC,"NW_RIVIATCHTALK")==99;
}

void PetyrToldPlot(object oPC)
{
    SetLocalInt(oPC,"NW_PETYRTALK",10);
}

void PetyrPlotTaken(object oPC)
{
    SetLocalInt(GetModule(),"NW_WIZAPP",10);
    SetLocalInt(oPC,"NW_PETYRTALK",20);
}

int PCAskedAboutMirror(object oPC)
{
    return GetLocalInt(oPC,"NW_PETYRTALK")==15;
}

void PetyrToldAboutMirror(object oPC)
{
    SetLocalInt(oPC,"NW_PETYRTALK",15);
}

int PCKnowsPetyr(object oPC)
{
    return GetLocalInt(oPC,"NW_PETYRTALK")==10;
}

int PCOnPetyrsPlot(object oPC)
{
    return GetLocalInt(oPC,"NW_PETYRTALK")==20;
}

int PCSavedApprentice(object oPC)
{
    return GetLocalInt(GetModule(),"NW_WIZAPP")==99;
}

int PCKilledApprentice(object oPC)
{
    return GetLocalInt(GetModule(),"NW_WIZAPP")==80;
}

void PetyrPlotDone(object oPC)
{
    SetLocalInt(oPC,"NW_PETYRTALK",99);
}

void PetyrEnchantingWeapon(object oPC)
{
    SetLocalInt(oPC,"NW_PETYRTALK",80);
}

void DarkfistGameOn(object oPC)
{
    SetLocalInt(GetModule(),"NW_DARKFISTGAME",10);
}

void PCEntersOnusHouse(object oPC)
{
    SetLocalInt(GetModule(),"NW_ONUSHOUSE",10);
}

void PCLeavesOnusHouse(object oPC)
{
    SetLocalInt(GetModule(),"NW_ONUSHOUSE",20);
}


//Thief Locals

void PCIsAThief(object oPC)
{
    SetLocalInt(oPC,"NW_THIEFSKILL",GetLocalInt(oPC,"NW_THIEFSKILL")+10);
}

void PCIsAThiefArgali(object oPC)
{
    SetLocalInt(oPC,"NW_THIEFARGALI",10);
}

int IsPCAThiefArgali(object oPC)
{
    return GetLocalInt(oPC,"NW_THIEFARGALI")==10;
}

void PCIsAThiefSobrey(object oPC)
{
    SetLocalInt(oPC,"NW_THIEFSOBREY",10);
}

int IsPCAThiefSobrey(object oPC)
{
    return GetLocalInt(oPC,"NW_THIEFSOBREY")==10;
}

//locals in hell

void PCAttackedGaeozil(object oPC)
{
    SetLocalInt(oPC,"NW_GAEOZILSTATE",30);
}

void PCMetGaeozilOnce(object oPC)
{
    SetLocalInt(oPC,"NW_GAEOZILSTATE",10);
}

void PCIsStillHere(object oPC)
{
    SetLocalInt(oPC,"NW_PCINHELL",10);
}

void PCLeftHell(object oPC)
{
    SetLocalInt(oPC,"NW_PCINHELL",0);
}

int PCStillInHell(object oPC)
{
    return GetLocalInt(oPC,"NW_PCINHELL")==10;
}

int PCSpokeToVrock(object oPC)
{
    return GetLocalInt(oPC,"NW_GAEOZILSTATE")==10;
}

int PCAttackedVrock(object oPC)
{
    return GetLocalInt(oPC,"NW_GAEOZILSTATE")==30;
}

void PCMetGaeozilTwice(object oPC)
{
    SetLocalInt(oPC,"NW_GAEOZILSTATE",20);
}

int PCSpokeToVrockTwice(object oPC)
{
    return GetLocalInt(oPC,"NW_GAEOZILSTATE")==20;
}

void PCMetGaeozilThrice(object oPC)
{
    SetLocalInt(oPC,"NW_GAEOZILSTATE",40);
}

int PCSpokeToVrockThrice(object oPC)
{
    return GetLocalInt(oPC,"NW_GAEOZILSTATE")==40;
}

int PlayerHasDiedBefore(object oPC)
{
    return GetLocalInt(oPC,"NW_GAEOZILSTATE")> 0;
}

