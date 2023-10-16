//::///////////////////////////////////////////////
//::   q6_apprentice01
//:: Copyright (c) 2001 Bioware Corp.
//:: Created By: Drew Karpyshyn
//:: Created On: September 4, 2003
//::
//:://////////////////////////////////////////////
//::
//::This sets the talk level on the apprentice and
//::gives the player the apprentices mirror shard
//::
//:://////////////////////////////////////////////

void main()
{
    AddJournalQuestEntry("q6_wizard",99,GetPCSpeaker());

    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);

}

