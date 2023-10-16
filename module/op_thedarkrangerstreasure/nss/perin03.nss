//::///////////////////////////////////////////////
//:: Perin Izrick's Conversation Script #3
//:: Perin03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Perin rejoins as a henchman. Sets the journal
    entry accordingly.
*/
//:://////////////////////////////////////////////

void main()
{
    //Turn Perin into a henchman.
    //By default, Companions are assigned the Attack Nearest Enemy && Follow Master modes
    SetAssociateListenPatterns();
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_COMBAT",ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_MOVEMENT",ASSOCIATE_COMMAND_FOLLOWMASTER);
    AddHenchman(GetPCSpeaker());

    //Set Journal Entry.
    AddJournalQuestEntry("Henchman", 10, GetPCSpeaker(), FALSE, FALSE, TRUE);
}

