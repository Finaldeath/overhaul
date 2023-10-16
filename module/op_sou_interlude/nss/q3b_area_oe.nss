// some setup for the portal room

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

void StoneForniture()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_FORNITURE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_FORNITURE_ONCE", 1);

    effect eStone = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "Q3B_FORNITURE")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oObject);
        oObject = GetNextObjectInArea();
    }
}

// Destroy all formians when leaving
void HandleFormians()
{
    object oFormianArea = GetObjectByTag("q3c_FormiansHive");
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        if(GetArea(oPC) == oFormianArea)
            return; // a player is still in this area.
        oPC = GetNextPC();
    }

    if(GetLocalInt(GetModule(), "Q3_FORMIAN_CRYSTAL_GIVEN") == 1)
    {
        object oFormian = GetFirstObjectInArea(oFormianArea);
        object oMaster;
        while(oFormian != OBJECT_INVALID)
        {
            if(GetRacialType(oFormian) == RACIAL_TYPE_OUTSIDER)
                DestroyObject(oFormian);
            if(GetMaster(oFormian) != OBJECT_INVALID)
            {
                oMaster = GetMaster(oFormian);
                AssignCommand(oMaster, JumpToObject(oMaster));
            }
            oFormian = GetNextObjectInArea(oFormianArea);
        }
    }
}

void main()
{
    object oPC = GetEnteringObject();

    object oWP = GetLocalObject(GetModule(), "X1_CURRENT_START");
    if(GetIsPC(oPC) && GetTag(oWP) == "Q4_START")
    {
         AssignCommand(oPC, JumpToObject(oWP));
         return;
    }

    DoSaveGame();
    StoneForniture();
    HandleFormians();

    if(GetItemPossessedBy(oPC, "q3_formcrystal") != OBJECT_INVALID) // player carries the formian crystal
    {
        int nDoOnce = GetLocalInt(oPC, "DO_FORMIAN_HINT_ONCE");
        if(nDoOnce == 0)
        {
            SetLocalInt(oPC, "DO_FORMIAN_HINT_ONCE", 1);
            AssignCommand(oPC, SpeakOneLinerConversation("q3_formcrystal"));
        }
    }

    if(GetLocalInt(GetModule(), "Q3_FORMIAN_CRYSTAL_GIVEN") == 1)
    {
        object oFormian = GetFirstObjectInArea(OBJECT_SELF);
        while(oFormian != OBJECT_INVALID)
        {
            if(GetMaster(oFormian) == OBJECT_INVALID &&
                (GetTag(oFormian) == "X0_FORM_MYRMARCH" || GetTag(oFormian) == "X0_FORM_WARRIOR"))
                DestroyObject(oFormian);
            oFormian = GetNextObjectInArea();
        }
    }

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oBall = GetObjectByTag("Q3B_CRYSTALBALL");
    effect eVis = EffectVisualEffect(VFX_DUR_LIGHT_RED_20);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oBall);
    // create beam source at the obelisks:
    int i;
    for(i = 1; i <= 6; i++)
    {
        object oObelisk = GetObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
        vector vVec = GetPosition(oObelisk);
        vVec.z += 5;
        location lLoc = Location(OBJECT_SELF, vVec, 0.0);
        CreateObject(OBJECT_TYPE_PLACEABLE, "invisobj001", lLoc);
    }
}
