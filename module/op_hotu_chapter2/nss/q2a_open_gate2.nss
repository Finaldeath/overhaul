//If these gates have their lock picked and are openned - battle 1 is lost

void main()
{
    //Do nothing before the siege
    if (GetLocalInt(GetModule(), "X2_Bat1PCNoTransition") == 0)
        return;

    // Do nothing before the enemy comes in (after the cutscene)
    if (GetLocalInt(GetModule(), "X2_Bat1EnemyArrived") == 0)
        return;

    //If the PC picks the lock and opens the inner gate - then
    //the PC has betrayed the rebels - so start the rebel betrayal cutscene.
    object oPC = GetLastOpenedBy();

    SetLocalInt(GetModule(), "X2_InnerGatePicked", 1);

    //Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 0);

    if (GetLocalInt(OBJECT_SELF, "nCutscene103") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nCutscene103", 1);

    //10 point evil hit
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);

    //if the rebels have already been betrayed - don't start the cutscene again
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;
    //don't show the summoning scene if gets triggered
    SetLocalInt(GetModule(), "NoShowCutscene105", 1);

    //spawn in the faction boys for the cutscene creatures
    location lSpawn = GetLocation(GetWaypointByTag("wp_factionboys"));
    CreateObject(OBJECT_TYPE_CREATURE, "q2_faction1boy", lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE, "q2_faction2boy", lSpawn);
    AddJournalQuestEntry("q2_Valsharess",66,GetFirstPC());
    ExecuteScript("cutscene103", oPC);



}

