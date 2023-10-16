// Stingers attack the caravan - they are spawned from 3 different places - each place is a hole

#include "NW_I0_GENERIC"

void CreateSingleStinger(object oWP, location lLoc)
{
    object oStinger = CreateObject(OBJECT_TYPE_CREATURE, "q1_stinger", lLoc);
    AssignCommand(oStinger, ActionMoveToObject(oWP, TRUE));
}

void CreateStingers(location lLoc)
{
    object oWP = GetWaypointByTag("Q1_WP_STINGER_RUNTO");
    object oStinger;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_WARRIOR_ONCE");
    if(nDoOnce == 0)
    {
        oStinger = CreateObject(OBJECT_TYPE_CREATURE, "q1_stinger_war", lLoc);
        AssignCommand(oStinger, ActionMoveToObject(oWP, TRUE));
    }
    else
        SetLocalInt(OBJECT_SELF, "DO_WARRIOR_ONCE", 1);


    int nTotalLevels = 0;
    object oHenchman;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        nTotalLevels += GetCharacterLevel(oPC);
        oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        if(oHenchman != OBJECT_INVALID)
            nTotalLevels += GetCharacterLevel(oHenchman);

        oPC = GetNextPC();
    }
    // Create 2 stingers for a single player (under 8 total levels)
    //        3 stingers for a player + henchman or 2 players (total levels of 8 to 16)
    //        4 stingers for 2 players with a single henchman (total levels of 17 to 24)
    //        5 stingers for any other option (more than 24)
    int nStingersNum = 2;
    if(nTotalLevels < 8)
        nStingersNum = 2;
    else if(nTotalLevels >= 8 && nTotalLevels <= 16)
        nStingersNum = 3;
    else if(nTotalLevels >= 17 && nTotalLevels <= 24)
        nStingersNum = 4;
    else
        nStingersNum = 5;

    int i;
    for(i = 1; i <= nStingersNum; i++)
        CreateSingleStinger(oWP, lLoc);
}

void CreateHole(object oSP, string sDest)
{
    effect eDam = EffectDamage(1000);
    DelayCommand(1.0, CreateStingers(GetLocation(oSP)));
    object oHole = CreateObject(OBJECT_TYPE_PLACEABLE, "q1_hole", GetLocation(oSP));
    object oDust = CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertboulder", GetLocation(oSP));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oDust);
    SetLocalString(oHole, "Q1_HOLE_DEST", sDest);
}

void CreateTracks()
{
    object oSP1 = GetNearestObjectByTag("Q1A_TRACKS_SP1");
    object oSP2 = GetNearestObjectByTag("Q1A_TRACKS_SP2");

    CreateObject(OBJECT_TYPE_PLACEABLE, "nightcamotracks", GetLocation(oSP1));
    CreateObject(OBJECT_TYPE_PLACEABLE, "nightcamotracks", GetLocation(oSP2));
}

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ATTACK_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ATTACK_ONCE", 1);
    // first, destroy sound objects
    object oSound1 = GetObjectByTag("Q1_STINGER_SOUND1");
    object oSound2 = GetObjectByTag("Q1_STINGER_SOUND2");
    object oSound3 = GetObjectByTag("Q1_STINGER_SOUND3");
    DestroyObject(oSound1);
    DestroyObject(oSound2);
    DestroyObject(oSound3);

    object oMap1 = GetNearestObjectByTag("Q1_MAPNOTE1");
    object oMap2 = GetNearestObjectByTag("Q1_MAPNOTE2");
    object oMap3 = GetNearestObjectByTag("Q1_MAPNOTE3");
    SetMapPinEnabled(oMap1, 1);
    SetMapPinEnabled(oMap2, 1);
    SetMapPinEnabled(oMap3, 1);

    // first, create holes
    int n = 1;
    object oHoleSpawn1 = GetNearestObjectByTag("Q1_HOLE_SPAWN1");
    object oHoleSpawn2 = GetNearestObjectByTag("Q1_HOLE_SPAWN2");
    object oHoleSpawn3 = GetNearestObjectByTag("Q1_HOLE_SPAWN3");

    CreateHole(oHoleSpawn1, "Q1_WP_ARRIVE_HOLE1");
    CreateHole(oHoleSpawn2, "Q1_WP_ARRIVE_HOLE2");
    CreateHole(oHoleSpawn3, "Q1_WP_ARRIVE_HOLE3");

    // next, create the rocks
    n = 1;
    object oRockSpawn = GetNearestObjectByTag("Q1_ROCKS_SPAWN", OBJECT_SELF, n);
    while(oRockSpawn != OBJECT_INVALID)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertrocks", GetLocation(oRockSpawn));
        n++;
        oRockSpawn = GetNearestObjectByTag("Q1_ROCKS_SPAWN", OBJECT_SELF, n);
    }
    // finally, make sure Zidan vanishes (kidnapped)
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    object oWP2 = GetWaypointByTag("Q1_WP_ZIDAN_RUNTO");
    DelayCommand(6.0, SignalEvent(oZidan, EventUserDefined(101)));
    DelayCommand(7.0, CreateTracks());
}
