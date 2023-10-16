//::///////////////////////////////////////////////
//:: Name   q2a_startbattle1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start Battle 1
    Spawn in Defenders.  Let PC place them.
    Spawn in Attack in x seconds.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    //Set Up the BattleMaster
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    object oArea = GetArea(oBattleMaster);

    object oPC = OBJECT_SELF;

    //Set module variable for catapult betrayal
    SetLocalInt(GetModule(), "X2_BetrayOptionOpen", 1);
    //Clear the area of ambients
    ExecuteScript("bat1_emptyarea", oPC);
    //Spawn in Defenders.
    DelayCommand(2.0, ExecuteScript("bat1_spawndef", oBattleMaster));

}

