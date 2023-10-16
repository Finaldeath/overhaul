//::///////////////////////////////////////////////
//:: Remove one henchman and add another to PCs party
//:: q2a_hen_switch
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove PCs first henchman and add whichever one
    he/she is currently talking to
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 26, 2002
//:://////////////////////////////////////////////

void main()
{
    //Remove old henchman
    object oHench = GetHenchman(GetPCSpeaker());
    RemoveHenchman(GetPCSpeaker(), oHench);
    SetLocalInt(oHench, "nHaveMaster", 0);

    //Add new henchman
    SetAssociateListenPatterns();
    SetLocalInt(OBJECT_SELF,"NW_L_HEN_I_DIED",FALSE);
    // * Companions, come in, by default with Attack Nearest Enemy && Follow Master modes
    SetLocalInt(OBJECT_SELF, "NW_COM_MODE_COMBAT", ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(OBJECT_SELF, "NW_COM_MODE_MOVEMENT", ASSOCIATE_COMMAND_FOLLOWMASTER);
    AddHenchman(GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "nHaveMaster", 1);
    if (GetTag(OBJECT_SELF) == "xp_hen_nyro")
        AddJournalQuestEntry("Henchman", 20, GetPCSpeaker(), FALSE, FALSE, TRUE);
    else
        AddJournalQuestEntry("Henchman", 10, GetPCSpeaker(), FALSE, FALSE, TRUE);
}
