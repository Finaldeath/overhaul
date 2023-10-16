//::///////////////////////////////////////////////
//:: Catching the Wise Wind (Action - Read)
//:: A_Catching_Read.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the Wise Wind area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    //Determine the battle map and identify the corresponding reference point
    string sMap = GetLocalString(GetArea(OBJECT_SELF), "sWiseWindMap");
    object oRefPoint = GetObjectByTag("Ref_Library_"+sMap);

    int bWindDoOnce = GetLocalInt(GetModule(), "bWiseWindSpawn");
    if (bWindDoOnce == FALSE)
    {
        //Spawn in the Wise Wind
        object oWindSpawn = GetNearestObjectByTag("WiseWindTarget", oRefPoint);
        location lWindSpawn = GetLocation(oWindSpawn);
        object oWind = CreateObject(OBJECT_TYPE_CREATURE, "wisewind", lWindSpawn);
        //Flag the DoOnce
        SetLocalInt(GetModule(), "bWiseWindSpawn", TRUE);
    }

    //Spawn in William if necessary
    int bWilliamJoins = GetLocalInt(GetModule(), "bWilliamJoins");
    int bWilliamDoOnce = GetLocalInt(GetModule(), "bWilliamSpawn");
    if (bWilliamJoins == TRUE &&
        bWilliamDoOnce == FALSE)
    {
        object oWilliamSpawn = GetNearestObjectByTag("SirWilliamSpawn", oRefPoint);
        location lWilliamSpawn = GetLocation(oWilliamSpawn);
        object oNewWilliam = CreateObject(OBJECT_TYPE_CREATURE, "sirwilliam", lWilliamSpawn);
        //Remove his plot flag.
        SetPlotFlag(oNewWilliam, FALSE);
        //Flag the DoOnce
        SetLocalInt(GetModule(), "bWilliamSpawn", TRUE);
    }

    //Spawn in Karsus if necessary
    int bKarsusJoins = GetLocalInt(GetModule(), "bKarsusJoins");
    int bKarsusDoOnce = GetLocalInt(GetModule(), "bKarsusSpawn");
    if (bKarsusJoins == TRUE &&
        bKarsusDoOnce == FALSE)
    {
        object oKarsusSpawn = GetNearestObjectByTag("KarsusSpawn", oRefPoint);
        location lKarsusSpawn = GetLocation(oKarsusSpawn);
        object oNewKarsus = CreateObject(OBJECT_TYPE_CREATURE, "karsus", lKarsusSpawn);
        //Get rid of his inkwell.
        object oInkwell = GetItemPossessedBy(oNewKarsus, "Library_Inkwell");
        DestroyObject(oInkwell);
        //Make his staff undroppable
        object oStaff = GetItemPossessedBy(oNewKarsus, "NW_WMGST004");
        SetDroppableFlag(oStaff, FALSE);
        //Flag the DoOnce
        SetLocalInt(GetModule(), "bKarsusSpawn", TRUE);
    }

    //Jump the player
    object oPC = GetPCSpeaker();
    object oTarget = GetNearestObjectByTag("PlayerSpawn", oRefPoint);
    AssignCommand(oPC, JumpToObject(oTarget));

    //Replace the Empty Tome
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, "CatchingTheWind", lLoc);
    DestroyObject(OBJECT_SELF, 0.1);
}

