//::///////////////////////////////////////////////
//:: Name q2d8_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When entered (this area is only entered when the
    Brain Pool is threatened and sends the PC here),
    a gender specific NPC will approach the PC and
    try to convince him that everything is allright.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    DoSinglePlayerAutoSave();
    location lSpawn = GetLocation(GetWaypointByTag("wp_q2d8_nicespawn"));
    string szResRef;
    if (GetGender(oPC) == GENDER_FEMALE)
        szResRef = "q2d8man";
    else
        szResRef = "q2d8woman";

    object oGreeter = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oGreeter, ActionStartConversation(oPC));

}
