//If these gates are destroyed - battle 1 is lost
void JumpPCToBattle2();
void main()
{
    //If the PC was the last one to damage the inner gate - destroying it - then
    //the PC has betrayed the rebels - so start the rebel betrayal cutscene.
    object oPC = GetLastDamager();
    if(GetMaster(oPC) != OBJECT_INVALID) // a henchmen broke the gate
        oPC = GetMaster(oPC);
    string szPCTag = GetTag(oPC);

    //Also need to check if its area effect created by one of the good guys attacking the Player
    if (oPC == OBJECT_SELF || GetIsPC(oPC) == TRUE || szPCTag == "x2_hen_nathyra" || szPCTag == "x2_hen_valen" || szPCTag == "q2abat1reb3")
    {
        if(oPC == OBJECT_SELF)
            oPC = GetFirstPC();
        //object oPC = GetPCSpeaker();
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
    else
    {
        //do nothing if blown up by a powderkeg
        if (GetLocalInt(GetModule(), "X2_Battle1PowderKeg") == 1)
            return;

        //Only run this script once..
        if (GetLocalInt(OBJECT_SELF, "nBattle1Lost") == 1)
                return;
        SetLocalInt(OBJECT_SELF, "nBattle1Lost", 1);

        //End Battle Variables
        SetLocalInt(GetModule(), "X2_Q2ABattle1Lost", 1);
        SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);
        SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);


        //Run the Gate Destruction Cutscene here
        object oBattleMaster = GetObjectByTag("q2abattle2master");
        ExecuteScript("cutscene104", oBattleMaster);

    }

}
void JumpPCToBattle2()
{
    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC, "X2_Q2ABattle1Lost", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oTarget)));
        oPC = GetNextPC();
    }
}
