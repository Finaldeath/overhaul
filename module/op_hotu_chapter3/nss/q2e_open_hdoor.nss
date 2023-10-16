//::///////////////////////////////////////////////
//:: Name  q2e_open_hdoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When openned, this door will give the PC the
    choice of returning home to Waterdeep...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main ()
{
    //Autosave
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bAutosaved");
    if (bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bAutosaved", TRUE);
        DoSinglePlayerAutoSave();
    }

    object oPC = GetLastUsedBy();
    object oDoor = OBJECT_SELF;
    //Open the new door
    AssignCommand(oDoor, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
    //Start the dialog with the PC that used the door
    string szTag = "con_hod_homedoor";

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oDoor, ActionStartConversation(oPC, szTag));
}

