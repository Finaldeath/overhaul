//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #4
//:: lordiridor04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Unlock the 4 keep doors and set the main plot
    global to 1 (quest active). Give the Key to
    the Crypts of Mount Iridor. Activate all of
    the encounters in the the Mount Iridor area.
*/
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();

    //unlock the 4 keep doors
    object oKeepNorth = GetObjectByTag("KeepNorth");
    object oKeepSouth = GetObjectByTag("KeepSouth");
    object oKeepWest = GetObjectByTag("KeepWest");
    object oKeepEast = GetObjectByTag("KeepEast");

    SetLocked(oKeepNorth, FALSE);
    SetLocked(oKeepSouth, FALSE);
    SetLocked(oKeepWest, FALSE);
    SetLocked(oKeepEast, FALSE);

    //Set the main plot global to indicate that the plot is now active.
    SetLocalInt(GetModule(), "MainPlot", 1);

    //Give the Crypt Key
    object oPC = GetPCSpeaker();

    CreateItemOnObject("iridorcryptkey", oPC);

    //Activate all of the encounters in the Mount Iridor area.
    int iNth = 0;
    object oEncounter = GetObjectByTag("IridorUndead", iNth);

    while (GetIsObjectValid(oEncounter))
    {
        SetEncounterActive(TRUE, oEncounter);
        iNth++;
        oEncounter = GetObjectByTag("IridorUndead", iNth);
    }

    ActionResumeConversation();
}
