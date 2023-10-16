//::///////////////////////////////////////////////
//:: Add a henchman to party
//:: q2a_add_hench
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have a henchman join the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 26, 2002
//:://////////////////////////////////////////////

//Have a henchman join the PC
void main()
{
    SetAssociateListenPatterns();
    SetLocalInt(OBJECT_SELF,"NW_L_HEN_I_DIED",FALSE);
    // * Companions, come in, by default with Attack Nearest Enemy && Follow Master modes
    SetLocalInt(OBJECT_SELF, "NW_COM_MODE_COMBAT", ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(OBJECT_SELF, "NW_COM_MODE_MOVEMENT", ASSOCIATE_COMMAND_FOLLOWMASTER);
    AddHenchman(GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "nHaveMaster", 1);
    AddJournalQuestEntry("Henchman", 20, GetPCSpeaker(), FALSE, FALSE, TRUE);
}
