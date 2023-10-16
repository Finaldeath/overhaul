// elemental death event:
// 1. Mark appropriate path as completed.
// 2. Light the appropriate pillar in the hub room.
// 3. Teleport all player and associates to hub room.
// 4. If all paths have been completed - open the doors.

void Teleport(object oObject)
{
    if(oObject == OBJECT_INVALID)
        return;
    object oWP = GetWaypointByTag("Q3B_WP_RETURN");
    AssignCommand(oObject, ClearAllActions());
    effect eVis = EffectVisualEffect(VFX_FNF_PWSTUN);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oObject));
    DelayCommand(3.0, AssignCommand(oObject, JumpToObject(oWP)));
}

void TeleportPlayer(object oPC)
{
    Teleport(oPC);

    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

    Teleport(oHenchman);
    Teleport(oDominated);
    Teleport(oFamiliar);
    Teleport(oSummoned);
    Teleport(oAnimal);

}


void main()
{
    int nNum = GetLocalInt(GetArea(OBJECT_SELF), "Q3_NUMBER_OF_PATHS_COMPLETED");
    nNum++;
    SetLocalInt(GetArea(OBJECT_SELF), "Q3_NUMBER_OF_PATHS_COMPLETED", nNum);

    string sTag = GetTag(OBJECT_SELF);
    string sPillarTag;
    string sLight;

    if(sTag == "Q3_FIRE_ELEMENT")
    {
        sPillarTag = "Q3B_FINISH_FIRE";
        sLight = "q3_fire_path";
    }
    else if(sTag == "Q3_EARTH_ELEMENT")
    {
        sPillarTag = "Q3B_FINISH_EARTH";
        sLight = "q3_earth_path";
    }
    else if(sTag == "Q3_AIR_ELEMENT")
    {
        sPillarTag = "Q3B_FINISH_AIR";
        sLight = "q3_air_path";
    }
    else if(sTag == "Q3_WATER_ELEMENT")
    {
        sPillarTag = "Q3B_FINISH_WATER";
        sLight = "q3_water_path";
    }

    object oPillar = GetObjectByTag(sPillarTag);
    CreateObject(OBJECT_TYPE_PLACEABLE, sLight, GetLocation(oPillar));

    // teleport all players in this area
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        if(GetArea(oPC) == GetArea(OBJECT_SELF))
            TeleportPlayer(oPC);
        oPC = GetNextPC();
    }

    // now open the doors if needed
    if(nNum == 4)
    {
        object oKiller = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        CreateItemOnObject("q3b_token", oKiller);
        int nXP = GetJournalQuestExperience("xpmid");
        object oPC = GetFirstPC();
        while (oPC != OBJECT_INVALID)
        {
            GiveXPToCreature(oPC, nXP);
            oPC = GetNextPC();
        }
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
    }


}


