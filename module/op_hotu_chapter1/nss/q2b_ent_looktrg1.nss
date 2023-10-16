//::///////////////////////////////////////////////
//:: Name q2b_ent_looktrg1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When this trigger is entered by a PC - the lookout
     will run back into the room

    ASSUMPTION (BK AUGUST 7 2003) -- A drow male says this
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 17/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    //if the enterer is a drow - they are pursuing the PC into the hallway
    //stop them and move them to the rally point
    if (GetStringLeft(GetTag(oPC), 9) == "x2_q2drow")
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        int nRandomSpeak = Random(6);
        string szSpeak = "";
        switch (nRandomSpeak)
        {
            case 0:     szSpeak = GetStringByStrRef(84079);
                        break;
            case 1:     szSpeak = GetStringByStrRef(84080);
                        break;
            case 2:     szSpeak = GetStringByStrRef(84081);
                        break;
            case 3:
            case 4:
            case 5:
                        break;
        }
        AssignCommand(oPC, SpeakString(szSpeak, TALKVOLUME_SHOUT));
        AssignCommand(oPC, ActionMoveToObject(GetObjectByTag("wp_q2b_drowrally1"), TRUE));
        AssignCommand(oPC, SetFacingPoint(GetPosition(GetWaypointByTag("WP_q2b08rat_06"))));
    }

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oLookout = GetObjectByTag("x2_q2drowlookout1");
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oTarget = GetObjectByTag("wp_q2b_lookout1");
        if (GetGender(oPC) == GENDER_MALE)
            AssignCommand(oLookout, SpeakStringByStrRef(84082, TALKVOLUME_SHOUT));
        else
            AssignCommand(oLookout, SpeakStringByStrRef(84083, TALKVOLUME_SHOUT));
        AssignCommand(oLookout, ActionMoveToObject(oTarget, TRUE));
        AssignCommand(oLookout, SetFacingPoint(GetPosition(GetWaypointByTag("WP_q2b08rat_06"))));
    }
}
